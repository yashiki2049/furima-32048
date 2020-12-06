class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :user_items

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'Include both letters and numbers' }

  with_options presence: true do
    validates :nickname
    validates :birth_date

    with_options format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'Full-width characters' } do
      validates :last_name
      validates :first_name
    end

    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters' } do
      validates :last_name_kana
      validates :first_name_kana
    end
  end
end
