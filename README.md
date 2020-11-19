# README# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| last_name       | string  | null: false |
| first_name      | string  | null: false |
| last_name_kana  | string  | null: false |
| first_name_kana | string  | null: false |
| birth_date      | integer | null: false |

### Association

- has_many :items
- has_one :transaction

## items テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| item_name            | string     | null: false                    |
| item_info            | text       | null: false                    |
| item_category        | string     | null: false                    |
| item_status          | string     | null: false                    |
| item_shipping_burden | string     | null: false                    |
| item_prefecture      | string     | null: false                    |
| item_shipping_day    | string     | null: false                    |
| item_price           | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## transactions テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| card_number        | integer    | null: false                    |
| card_exp_month     | integer    | null: false                    |
| card_exp_year      | integer    | null: false                    |
| card_security_code | integer    | null: false                    |
| postal_code        | string     | null: false                    |
| prefecture         | string     | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| building           | string     |                                |
| phone_number       | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user