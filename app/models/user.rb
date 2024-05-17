class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :items
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }

  validates :first_name, :last_name ,format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :first_name_kana, :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :nickname, :date_birth, :last_name, :first_name, :last_name_kana, :first_name_kana, presence: true
end
