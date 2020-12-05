class ItemPurchase

  include ActiveModel::Model
  attr_accessor :postal_code,
                :prefecture_id,
                :city,
                :block,
                :building,
                :phone_number,
                :user_item_id,
                :user_id,
                :item_id,
                :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly' }
    validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'Input only number' }
    validates :token
  end

  def save
    useritem = UserItem.create(user_id: user_id,
                               item_id: item_id)

    Address.create(postal_code: postal_code,
                   prefecture_id: prefecture_id,
                   city: city,
                   block: block,
                   building: building,
                   phone_number: phone_number,
                   user_item_id: useritem.id)
  end
end