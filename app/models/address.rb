class Address < ApplicationRecord
  belongs_to :user
  belongs_to :user_items
end
