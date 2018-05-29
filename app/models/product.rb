class Product < ApplicationRecord
  belongs_to :category, counter_cache: true

  validates :name, presence: true
  validates :image, presence: true, url: true
  validates :url, presence: true, url: true
  validates :score, presence: true, numericality: true
  validates :price, presence: true, numericality: true

  scope :sorted, -> { order('score DESC') }

  after_save :check_max_score, if: :score_changed?

  private

    def check_max_score
      return if category.max_product_score > score

      category.update_attributes(max_product_score: score, image: image)
    end
end
