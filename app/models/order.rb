class Order < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :postcode, presence: true, format: {with: /\A\d{3}[-]\d{4}\z/}
  validates :regiondelivery_id, numericality: { other_than: 1 }
  validates :municipalities, presence: true
  validates :blocknumber, presence: true
  validates :telnumber, presence: true, format: {with: /\A\d{10,11}\z/}
  validates :item, presence: true
  attr_accessor :token
  validates :token, presence: true

  belongs_to :regiondelivery
  belongs_to :item
end
