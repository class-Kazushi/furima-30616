# README

## usersテーブル

| Column          | Type   | Option                    |
|-----------------|--------|---------------------------|
| nickname        | string | null: false               |
| email           | string | null: false, unique: true |
| Password        | string | null: false               |
| family_name     | string | null: false               |
| first_name      | string | null: false               |
| family_furigana | string | null: false               |
| first_furigana  | string | null: false               |
| birthday        | string | null: false               |

### Association

has_many :products
has_many :purchase_records

## productsテーブル

| Column          | Type       | Option            |
|-----------------|------------|-------------------|
| name            | string     | null: false       |
| details         | text       | null: false       |
| category        | integer    | null: false       |
| condition       | integer    | null: false       |
| delivery_charge | integer    | null: false       |
| region          | integer    | null: false       |
| period          | integer    | null: false       |
| user            | references | foreign_key: true |

### Association

belongs_to :user
has_one :purchase_record

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
| prefecture         | integer    | null: false       |
| city               | string     | null: false       |
| address_num        | string     | null: false       |
| building_name      | string     |                   |
| phone_num          | string     | null: false       |
| purchase_record    | references | foreign_key: true |

### Association

belongs_to :purchase_record