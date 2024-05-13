# テーブル設計

## users テーブル
| Column              | Type   | Options       |
|---------------------|--------|---------------|
| email               | string | null: false , unique: true  |
| encrypted_password            | string | null: false   |
| nickname            | string | null: false   |
| date_birth          | string | null: false   |
| last_name           | string | null: false   |
| first_name          | string | null: false   |
| last_name_kana  | string | null: false   |
| first_name_kana | string | null: false   |

### Association

- has_many :items


## items テーブル
| Column           | Type   | Options     |
|------------------|--------|-------------|
| email               | string | null: false , unique: true  |
| item_name            | string | null: false |
| price          | int    | null: false |
| image          | image  | null: false |
| description        | text   | null: false |
| category        | string | null: false |
| condition        | string | null: false |
| cost_delivery      | string | null: false |
| region_delivery      | string | null: false |
| date_delivery    | string | null: false |

### Association
- belongs_to :users



