# README

## users テーブル

| Column              | Type   | Options                    |
| ------------------- | ------ | -------------------------- |
| nickname            | string | null: false                |
| email               | string | null: false, unique: true  |
| encrypted_password  | string | null: false                |
| last_name           | string | null: false                |
| first_name          | string | null: false                |
| last_name_reading   | string | null: false                |
| first_name_reading  | string | null: false                |
| birthday            | date   | null: false                |

### Association

- has_many : items
- has_many : order_histories


## items テーブル

| Column              | Type          | Options                        |
| ------------------- | ------------- | ------------------------------ |
| item_name           | string        | null: false                    |
| item_description    | text          | null: false                    |
| category_id         | integer       | null: false                    |
| condition_id        | integer       | null: false                    |
| shipping_code_id    | integer       | null: false                    |
| prefecture_id       | integer       | null: false                    |
| shipping_day_id     | integer       | null: false                    |
| price               | integer       | null: false                    |
| user                | references    | null: false, foreign_key: true |

### Association
- has_one : order_history
- belongs_to : user



## order_histories テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association
- belongs_to : user
- belongs_to : item
- has_one : address



## addresses テーブル

| Column           | Type          | Options                        |
| ---------------- | ------------- | ------------------------------ |
| postal_code      | string        | null: false                    |
| prefecture_id    | integer       | null: false                    |
| city             | string        | null: false                    |
| house_number     | string        | null: false                    |
| building_name    | string        |                                |
| telephone_number | string        | null: false                    |
| order_history    | references    | null: false, foreign_key: true |

### Association
- belongs_to : order_history

