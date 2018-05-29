json.category @category.name

json.products @category.products.sorted, :id, :name, :image, :price, :url
