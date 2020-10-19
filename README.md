# README

## usersテーブル

| Column      | Type   | Option                    |
|-------------|--------|---------------------------|
| Family_name | string | null: false               |
| First_name  | string | null: false               |
| Email       | string | null: false, unique: true |
| Password    | string | null: false               |

### Association

has_many :products
has_many :purchase_records

## productsテーブル

| Column          | Type       | Option            |
|-----------------|------------|-------------------|
| image           |            |                   |
| name            | string     | null: false       |
| details         | text       | null: false       |
| category        | string     | null: false       |
| condition       | string     | null: false       |
| delivery_charge | string     | null: false       |
| region          | string     | null: false       |
| period          | string     | null: false       |
| user_id         | references | foreign_key: true |

### Association

belongs_to :user
has_one :purchase_record

## purchase_recordsテーブル

| Column          | Type       | Option            |
|-----------------|------------|-------------------|
| credit_num      | string     | null: false       |
| credit_code     | string     | null: false       |
| expiration_date | string     | null: false       |
| credit_name     | string     | null: false       |
| user_id         | references | foreign_key: true |

### Association

belongs_to :user
has_one :product
has_many :addresses

## addressesテーブル

| Column             | Type       | Option            |
|--------------------|------------|-------------------|
| postal_code        | string     | null: false       |
| prefecture         | string     | null: false       |
| city               | string     | null: false       |
| address            | string     | null: false       |
| phone_num          | references | null: false       |
| purchase_record_id | references | foreign_key: true |

### Association

belongs_to :purchase_record