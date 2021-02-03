# テーブル設計

## users テーブル

| Column              | Type    | Options                  |
| ------------------- | ------- | ------------------------ |
| nickname            | string  | null: false, index: true |
| email               | string  | null: false              |
| encrypted_password  | string  | null: false              |
| first_name          | integer | null: false              |
| last_name           | string  | null: false              |
| first_name_kana     | string  | null: false              |
| last_name_kana      | string  | null: false              |
| birth_date          | date    | null: false              |

### Association

- has_many :items
- has_many :item_transactions

## items テーブル

| Column                 | Type    | Options           |
| ---------------------- | ------- | ----------------- |
| name                   | string  | null: false       |
| info                   | text    | null: false       |
| price                  | integer | null: false       |
| scheduled_delivery_id  | integer | null: false       |
| shipping_fee_status_id | integer | null: false       |
| prefecture_id          | integer | null: false       |
| sales_status_id        | integer | null: false       |
| category_id            | integer | null: false       |
| user_id                | integer | foreign_key: true |

### Association

- belongs_to :users
- has_one :item_transactions

## item_transactions テーブル

| Column  | Type    | Options           |
| ------- | ------- | ----------------- |
| item_id | integer | foreign_key: true |
| user_id | integer | foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :address

## address テーブル

| Column              | Type    | Options           |
| ------------------- | ------- | ----------------- |
| postal_code         | integer | null: false       |
| prefecture_id       | integer | null: false       |
| city                | string  | null: false       |
| address             | string  | null: false       |
| building            | string  |                   |
| phone_number        | string  | null: false       |
| item_transaction_id | integer | foreign_key: true |

### Association

- belongs_to :item_transactions
