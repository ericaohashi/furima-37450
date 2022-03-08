# README
## usersテーブル
| Column             |Type    |Options                   |
|--------------------|--------|--------------------------|
| last_name          | string | null: false              |
| first_name         | string | null: false              |
| lsat_kana          | string | null: false              |
| first_kana         | string | null: false              |
| encrypted_password | string | null: false              |
| email              | string | null: false,unique: true |
| nickname           | string | null: false              |
| birth              | date   | null: false              |

has_many :items


## itemsテーブル
| Column      | Type       | Options                       |
|-------------|------------|-------------------------------|
| item_name   | string     | null: false                   |
| price       | integer    | null: false                   |
| content     | text       | null: false                   |
| detail      | text       | null: false                   |
| user        | references | null: false,foreign_key: true |
| ship_fee    | text       | null: false                   |
| category    | text       | null: false                   |
| item_status | text       | null: false                   |
### Association
has_one :purchase
belongs_to :user

## purchasesテーブル
| Column  | Type       | Options                       |
|---------|------------|-------------------------------|
| item    | references | null: false,foreign_key: true |
| user    | references | null: false,foreign_key: true |
### Association
belongs_to :item
has_one :shipping

## shippingsテーブル
| Column     | Type       |Options            |
|------------|------------|-------------------|
| post       | string       | null: false       |
| prefecture | string       | null: false       |
| city       | string       | null: false       |
| address    | string       | null: false       |
| building   | string       |                   |
| phone      | integer      | null: false       |
### Association
belongs_to :purchase
