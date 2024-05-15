class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image

  # validates :title, :text, presence: true
  
  validates :category_id, :condition_id, :costdelivery_id, :regiondelivery_id, :datedelivery_id, numericality: { other_than: 1 , message:"can't be blank" } 
end
