namespace :import do
  desc 'Import all data from JSON files'
  task all: :environment do
    %w[categories products].each do |task|
      Rake::Task["import:#{task}"].execute
    end
  end

  desc 'Import categories from JSON file'
  task categories: :environment do
    categories = JSONLoader.new('db/seeds/categories.json').load

    categories.each do |category|
      Category.find_or_create_by(name: category)
    end

    puts "#{categories.size} categories were processed"
  end

  desc 'Import products from JSON file'
  task products: :environment do
    products = JSONLoader.new('db/seeds/products.json').load

    products.each do |product|
      category = Category.find_or_create_by(name: product['category'])
      product = category.products.find_or_create_by(product.except('category'))
    end

    puts "#{products.size} products were processed"
  end
end
