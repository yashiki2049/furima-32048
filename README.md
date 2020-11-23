# README# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| birth_date         | date    | null: false |

### Association

- has_many :items
- has_one :item_purchases

## items テーブル

| Column                  | Type       | Options                        |
| ----------------------- | ---------- | ------------------------------ |
| item_name               | string     | null: false                    |
| item_info               | text       | null: false                    |
| item_category_id        | integer    | null: false                    |
| item_status_id          | integer    | null: false                    |
| item_shipping_burden_id | integer    | null: false                    |
| item_prefecture_id      | integer    | null: false                    |
| item_shipping_day_id    | integer    | null: false                    |
| item_price              | integer    | null: false                    |
| user                    | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## item_purchases テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## user_items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |