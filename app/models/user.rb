class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true 
  validates :birth_date, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i , message: "Include both letters and numbers"}
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ , message: "Full-width characters"}
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ , message: "Full-width characters"}
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ , message: "Full-width katakana characters"}
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ , message: "Full-width katakana characters"}

  # has_many :items
  # has_one :item_purchases

end
