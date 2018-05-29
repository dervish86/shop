class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'citext'

    create_table :categories do |t|
      t.citext :name
      t.string :image
      t.float :max_product_score, default: 0
      t.integer :products_count, default: 0

      t.timestamps
    end

    add_index :categories, :name, unique: true, order: {name: :asc}
  end
end
