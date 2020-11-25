FactoryBot.define do
  factory :user do
    nickname { 'マイ' }
    email { 'test@mail' }
    password { 'mmm111' }
    password_confirmation { 'mmm111' }
    last_name { '鈴木' }
    first_name { '麻衣' }
    last_name_kana { 'スズキ' }
    first_name_kana { 'マイ' }
    birth_date { 19890101 }
  end
end