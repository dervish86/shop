class Category < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  scope :sorted, -> { order('name') }
  scope :not_empty, -> { where('products_count > ?', 0) }
end
