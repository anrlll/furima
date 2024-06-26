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
| category_id        | integer | null: false |
| condition_id        | integer | null: false |
| costdelivery_id      | integer | null: false |
| regiondelivery_id      | integer | null: false |
| datedelivery_id    | integer | null: false |
| user               | references | null: false , foreign_key: true  |

### Association
belongs_to: user
has_one: purchase

## purchases テーブル
| Column           | Type   | Options     |
|------------------|--------|-------------|
| user               | references | null: false , foreign_key: true  |
| item               | references | null: false , foreign_key: true  |

### Association
belongs_to: user
belongs_to: item
has_one: order


## orders テーブル
| Column           | Type   | Options     |
|------------------|--------|-------------|
| postcode            | string | null: false |
| regiondelivery_id          | integer    | null: false |
| municipalities        | string   | null: false |
| blocknumber        | string | null: false |
| buildingname        | string |  |
| telnumber        | string | null: false |
| purchase               | references | null: false , foreign_key: true  |

### Association
- belongs_to :purchase

