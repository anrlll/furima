class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :items
  has_many :purchases

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
