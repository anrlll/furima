class Userorder < ApplicationRecord
  include ActiveModel::Model
  extend ActiveHash::Associations::ActiveRecordExtensions
  attr_accessor :postcode, :regiondelivery_id, :municipalities, :blocknumber, :buildingname, :telnumber, :purchase_id, :token, :user_id, :item_id

  with_options presence: true do
    validates :postcode, format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :municipalities
    validates :blocknumber
    validates :telnumber, format: {with: /\A\d{10,11}\z/},length: { in: 10..11 }
    validates :token
    validates :item_id
    validates :user_id
  end

  validates :regiondelivery_id, numericality: { other_than: 1 }
  belongs_to :regiondelivery

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Order.create(postcode: postcode, regiondelivery_id: regiondelivery_id, municipalities: municipalities, blocknumber: blocknumber, buildingname: buildingname, telnumber: telnumber, purchase_id: purchase.id)
  end

end
