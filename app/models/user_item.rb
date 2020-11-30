class UserItem < ApplicationRecord
  belongs_to :item
  belongs_to :user
  has_one :item_purchases
end
