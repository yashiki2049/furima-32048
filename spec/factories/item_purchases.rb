FactoryBot.define do
  factory :item_purchase do
    postal_code { '000-0000' }
    prefecture_id { 1 }
    city { '鹿児島市中央町' }
    block { '1-1' }
    building { '山田ビル3F' }
    phone_number { '09012341234' }
    token { 'tok_abcdefghijk00000000000000000' }
    user_id { 1 }
    item_id { 1 }
  end
end
