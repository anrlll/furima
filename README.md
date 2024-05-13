# README

##writed by oku

# テーブル設計

## users テーブル
| Column              | Type   | Options       |
|---------------------|--------|---------------|
| nickname            | string | null: false   |
| email               | string | null: false   |
| password            | string | null: false   |
| last_name           | string | null: false   |
| first_name          | string | null: false   |
| last_name_furigana  | string | null: false   |
| first_name_furigana | string | null: false   |
| date_birth          | string | null: false   |
- has_many :items
- belongs_to :user_login

## user_login テーブル
| Column        | Type    | Options     |
|---------------|---------|-------------|
| メールアドレス | string  | null: false |
| パスワード     | string  | null: false |


## items テーブル
| Column           | Type   | Options     |
|------------------|--------|-------------|
| 商品画像          | image  | null: false |
| 商品名            | string | null: false |
| 商品の説明        | text   | null: false |
| カテゴリー        | string | null: false |
| 商品の状態        | string | null: false |
| 配送料の負担      | string | null: false |
| 発送元の地域      | string | null: false |
| 発送までの日数    | string | null: false |
| 販売価格          | int    | null: false |
- belongs_to :users



