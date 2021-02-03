# テーブル設計

## users テーブル

| Column              | Type   | Options                  |
| ------------------- | ------ | ------------------------ |
| nickname            | string | null: false, index: true |
| email               | string | null: false              |
| encrypted_password  | string | null: false              |
| first_name          | string | null: false              |
| last_name           | string | null: false              |
| first_name_kana     | string | null: false              |
| last_name_kana      | string | null: false              |
| birth_date          | date   | null: false              |

### Association

- has_many :items
- has_many :item_transactions

## items テーブル

| Column                 | Type       | Options           |
| ---------------------- | ---------- | ----------------- |
| name                   | string     | null: false       |
| info                   | text       | null: false       |
| price                  | integer    | null: false       |
| scheduled_delivery_id  | integer    | null: false       |
| shipping_fee_status_id | integer    | null: false       |
| prefecture_id          | integer    | null: false       |
| sales_status_id        | integer    | null: false       |
| category_id            | integer    | null: false       |
| user                   | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :item_transaction

## item_transactions テーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| item    | references | foreign_key: true |
| user    | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル

| Column              | Type       | Options           |
| ------------------- | ---------- | ----------------- |
| postal_code         | string     | null: false       |
| prefecture_id       | integer    | null: false       |
| city                | string     | null: false       |
| address             | string     | null: false       |
| building            | string     |                   |
| phone_number        | string     | null: false       |
| item_transaction    | references | foreign_key: true |

### Association

- belongs_to :item_transaction
