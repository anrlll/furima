class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :costdelivery
  belongs_to :condition
  belongs_to :category
  belongs_to :regiondelivery
  belongs_to :datedelivery

  validates :costdelivery_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 } 
  validates :category_id, numericality: { other_than: 1 } 
  validates :regiondelivery_id, numericality: { other_than: 1 } 
  validates :datedelivery_id, numericality: { other_than: 1 } 

  has_one_attached :image

  validates :image, presence: true

  validates :name, length: { in: 1..40 }, presence: true

  validates :description, length: { in: 1..1000 }, presence: true

  validates :price, numericality: {
    only_integer: true, greather_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999
  }
  validates :costdelivery_id, numericality: { other_than: 1 , message: "can't be blank"} 

  # validates :category_id, :condition_id, :costdelivery_id, :regiondelivery_id, :datedelivery_id, numericality: { other_than: 1, message:"can't be blank" }, presence: true
end
