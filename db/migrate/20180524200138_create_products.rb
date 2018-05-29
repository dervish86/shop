class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.references :category, foreign_key: true
      t.string :name
      t.string :image
      t.string :url
      t.float :score, default: 0
      t.decimal :price, precision: 15, scale: 2

      t.timestamps
    end

    add_index :products, [:category_id, :score], order: {category_id: :asc, score: :desc}
  end
end
