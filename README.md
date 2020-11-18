## users

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birth_day          | date   | null: false |

### Association

* has_many :items
* has_many :purchase_records

## items
<!-- 商品 -->

| Column           | Type    | Options                        |
| ---------------- | ------- | ------------------------------ |
| name             | string  | null: false                    |
| price            | integer | null: false, foreign_key: true |
| description      | text    | null: false                    |
| status_id   　　　| integer | null: false, foreign_key: true |
| shipping_cost_id | integer | null: false, foreign_key: true |
| prefecture_id    | integer | null: false, foreign_key: true |
| shipping_days_id | integer | null: false, foreign_key: true |
| user_id          | integer | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :purchase_record

## purchase_records  
<!-- 購入管理 -->

| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| item_id       | integer | null: false, foreign_key: true |
| user_id       | integer | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one :destination

## destinations  
<!-- 配送先 -->

| Column                    | Type    | Options                        |
| ------------------------- | ------- | ------------------------------ |
| post_code                 | string  | null: false                    |
| prefecture_id             | integer | null: false, foreign_key: true |
| city                      | string  | null: false                    |
| address                   | string  | null: false                    |
| building_name             | string  |                                |
| phone_number              | string  | null: false                    |
| purchase_record_id        | integer | null: false, foreign_key: true |

### Association
belongs_to :purchase_record
