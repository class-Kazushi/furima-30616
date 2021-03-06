# README

## usersテーブル

| Column          | Type   | Option                    |
|-----------------|--------|---------------------------|
| nickname        | string | null: false               |
| email           | string | null: false, unique: true |
| password        | string | null: false               |
| family_name     | string | null: false               |
| first_name      | string | null: false               |
| family_furigana | string | null: false               |
| first_furigana  | string | null: false               |
| birthday        | date   | null: false               |

### Association

has_many :products
has_many :purchase_records
has_many :comments

## productsテーブル

| Column             | Type       | Option            |
|--------------------|------------|-------------------|
| name               | string     | null: false       |
| details            | text       | null: false       |
| category_id        | integer    | null: false       |
| condition_id       | integer    | null: false       |
| delivery_charge_id | integer    | null: false       |
| region_id          | integer    | null: false       |
| period_id          | integer    | null: false       |
| price              | string     | null: false       |
| user               | references | foreign_key: true |

### Association

belongs_to :user
has_one :purchase_record
has_many :comments

## purchase_recordsテーブル

| Column          | Type       | Option            |
|-----------------|------------|-------------------|
| user            | references | foreign_key: true |
| product         | references | foreign_key: true |

### Association

belongs_to :user
belongs_to :product
has_one :address

## addressesテーブル

| Column             | Type       | Option            |
|--------------------|------------|-------------------|
| postal_code        | string     | null: false       |
| prefecture_id      | integer    | null: false       |
| city               | string     | null: false       |
| address_num        | string     | null: false       |
| building_name      | string     |                   |
| phone_num          | string     | null: false       |
| purchase_record    | references | foreign_key: true |

### Association

belongs_to :purchase_record

## Commentsテーブル

| Column  | Type       | Option            |
|---------|------------|-------------------|
| text    | text       | null: false       |
| user    | references | foreign_key: true |
| product | references | foreign_key: true |

belongs_to :user
belongs_to :product