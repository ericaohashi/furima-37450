# README
## usersテーブル
| Column             |Type    |Options                   |
|--------------------|--------|--------------------------|
| last_name          | string | null: false              |
| first_name         | string | null: false              |
| last_kana          | string | null: false              |
| first_kana         | string | null: false              |
| encrypted_password | string | null: false              |
| email              | string | null: false,unique: true |
| nickname           | string | null: false              |
| birth              | date   | null: false              |
### Association
has_many :items
has_many :purchases


## itemsテーブル
| Column         | Type       | Options                       |
|----------------|------------|-------------------------------|
| item_name      | string     | null: false                   |
| price          | integer    | null: false                   |
| content        | text       | null: false                   |
| schedule_id         | integer    | null: false                   |
| user           | references | null: false,foreign_key: true |
| ship_fee_id    | integer    | null: false                   |
| category_id    | integer    | null: false                   |
| item_status_id | integer    | null: false                   |
| prefecture_id  | integer    | null: false                   |
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
belongs_to :user

## shippingsテーブル
| Column        | Type         |Options                        |
|---------------|--------------|-------------------------------|
| post          | string       | null: false                   |
| prefecture_id | integer      | null: false                   |
| city          | string       | null: false                   |
| address       | string       | null: false                   |
| building      | string       |                               |
| phone         | string       | null: false                   |
| purchase      | references   | null: false,foreign_key: true |
### Association
belongs_to :purchase
