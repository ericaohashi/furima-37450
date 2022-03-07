# README
## usersテーブル
| Column             |Type    |Options                   |
|--------------------|--------|--------------------------|
| last-name          | string | null: false              |
| first-name         | string | null: false              |
| lsat-kana          | string | null: false              |
| first-kana         | string | null: false              |
| encrypted_password | string | null: false              |
| email              | string | null: false,unique: true |
| nickname           | string | null: false              |
| birth              | date   | null: false              |

has_many :items


## itemsテーブル
| Column    | Type       | Options                       |
|-----------|------------|-------------------------------|
| item-name | string     | null: false                   |
| price     | string     | null: false                   |
| detail    | text       | null: false                   |
| user      | references | null: false,foreign_key: true |
| ship-way  | text       | null: false                   |

has_one :purchase
belongs_to :user

## purchasesテーブル
| Column  | Type       | Options                       |
|---------|------------|-------------------------------|
| item    | references | null: false,foreign_key: true |
| user    | references | null: false,foreign_key: true |

belongs_to :item
has_one :shipping

## shippingsテーブル
| Column     | Type       |Options            |
|------------|------------|-------------------|
| post       | text       | null: false       |
| prefecture | text       | null: false       |
| city       | text       | null: false       |
| address    | text       | null: false       |
| building   | text       | null: false       |
| phone      | text       | null: false       |
belongs_to :purchase
