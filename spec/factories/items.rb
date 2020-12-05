FactoryBot.define do
  factory :item do
    name { '商品名' }
    info { '商品説明' }
    category_id { 1 }
    status_id { 1 }
    shipping_burden_id { 1 }
    prefecture_id { 1 }
    shipping_day_id { 1 }
    price { 300 }
    association :user
  end
end
