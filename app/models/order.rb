class Order < ApplicationRecord
  validates :postcode, presence: true
  validates :regiondelivery_id, numericality: { other_than: 1 }
  validates :municipalities, presence: true
  validates :blocknumber,presence: true
  validates :buildingname
  validates :telnumber, presence: true
   

  belongs_to :regiondelivery
  belongs_to :purchase
end
