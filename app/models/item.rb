class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image

  validates :image, presence: true

  validates :name, length: { in: 1..40 }, presence: true

  validates :description, length: { in: 1..1000 },presence: true

  validates :price, numericality: {
    only_integer: true, greather_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999
  }

  validates :category_id, :condition_id, :costdelivery_id, :regiondelivery_id, :datedelivery_id, numericality: { other_than: 1, message:"can't be blank" }, presence: true
end
