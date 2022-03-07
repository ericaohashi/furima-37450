# README
<!-- <userテーブル> -->
| Column   |Type|Options|
|----------|--------|-------------|
| kanji    | string | null: false |
| hurigana | string | null: false |
| email    | string | null: false |
| pass     | string | null: false |
| nickname | string | null: false |
| birth    | string | null: false |

has_many :items


<!-- <items> -->
| Column    | Type -----| Options           |
|-----------|-----------|-------------------|
| item-name | string    | null: false       |
| price     | string    | null: false       |
| detail    | text      | null: false       |
| user      | reference | foreign_key: true |
| ship-way  | text      | null: false      |

has_one :purchase

<!-- <purchase> -->
| Column  | Type      | Options           |
|---------|-----------|-------------------|
| item-id | reference | foreign_key: true |
| date    | text      | null: false       |

belongs_to :items
has_one :shipping

<!-- <shipping> -->
| Column   | Type      |Options            |
|----------|-----------|-------------------|
| address  | reference | foreign_key: true |

belongs_to :purchase
