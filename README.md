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
* has_many :purchase_record

## items
<!-- 商品 -->

| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| name          | string  | null: false                    |
| price         | string  | null: false                    |
| image         | string  | null: false                    |
| description   | string  | null: false                    |
<!-- | category        | string | null: false | -->
| status   　　　| string  | null: false                    |
| shipping_cost | string  | null: false                    |
| prefecture_id | string  | null: false                    |
| shipping_days | string  | null: false                    |
| user_id       | integer | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :purchase_record

## purchase_record  
<!-- 購入記録 -->

| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| item_id       | integer | null: false, foreign_key: true |
| user_id       | integer | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :items
has_one :destination

## destination  
<!-- 配送先 -->

| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| post_code     | string  | null: false                    |
| prefecture    | string  | null: false                    |
| city          | string  | null: false                    |
| address       | string  | null: false                    |
| building_name | string  |                                |
| phone_number  | string  | null: false                    |
| user_id       | integer | null: false, foreign_key: true |

### Association
belongs_to :purchase_record