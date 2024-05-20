class Order < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :postcode, presence: true
  validates :regiondelivery_id, numericality: { other_than: 1 }
  validates :municipalities, presence: true
  validates :blocknumber, presence: true
  validates :telnumber, presence: true
  validates :item, presence: true

  belongs_to :regiondelivery
  belongs_to :item
end
