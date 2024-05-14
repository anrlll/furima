# テーブル設計

## users テーブル
| Column              | Type   | Options       |
|---------------------|--------|---------------|
| email               | string | null: false , unique: true  |
| encrypted_password            | string | null: false   |
| nickname            | string | null: false   |
| date_birth          | date | null: false   |
| last_name           | string | null: false   |
| first_name          | string | null: false   |
| last_name_kana  | string | null: false   |
| first_name_kana | string | null: false   |

### Association
- has_many :items
- has_many :purchases


## items テーブル
| Column           | Type   | Options     |
|------------------|--------|-------------|
| name            | string | null: false |
| price          | integer    | null: false |
| description        | text   | null: false |
| category        | integer | null: false |
| condition        | integer | null: false |
| cost_delivery      | string | null: false |
| region_delivery      | string | null: false |
| date_delivery    | string | null: false |
| user               | references | null: false , foreign_key: true  |

### Association
belongs_to: user

## purchases テーブル
| Column           | Type   | Options     |
|------------------|--------|-------------|
| created_at               | date |   |
| user               | references | null: false , foreign_key: true  |
| item               | references | null: false , foreign_key: true  |
| delivery               | references | null: false , foreign_key: true  |

### Association
belongs_to: user
belongs_to: delivery
belongs_to: item


## deliveries テーブル
| Column           | Type   | Options     |
|------------------|--------|-------------|
| postcode            | string | null: false |
| prefecture          | integer    | null: false |
| municipalities        | string   | null: false |
| block_number        | string | null: false |
| building_name        | string |  |
| tel_number        | integer | null: false |
| user               | references | null: false , foreign_key: true  |

### Association
- belongs_to :user

