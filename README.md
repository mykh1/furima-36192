# README

## users テーブル

| Column              | Type   | Options      |
| ------------------- | ------ | ------------ |
| nickname            | string | null: false  |
| email               | string | null: false  |
| encrypted_password  | string | null: false  |
| last_name           | string | null: false  |
| first_name          | string | null: false  |
| last_name_reading   | string | null: false  |
| first_name_reading  | string | null: false  |
| birthday            | date   | null: false  |

### Association

- has_many : items
- has_many : order_histories


## items テーブル

| Column           | Type          | Options                        |
| ---------------- | ------------- | ------------------------------ |
| item_name        | string        | null: false                    |
| item_description | text          | null: false                    |
| category         | integer       | null: false                    |
| condition        | integer       | null: false                    |
| shipping_code    | integer       | null: false                    |
| prefecture       | integer       | null: false                    |
| shipping_day     | integer       | null: false                    |
| price            | integer       | null: false                    |
| user             | references    | null: false, foreign_key: true |

### Association
- has_one : order_histories
- belongs_to : users



## order_histories テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item      | references | null: false                    |
| user      | references | null: false, foreign_key: true |

### Association
- belongs_to : users
- belongs_to : items
- has_one : addresses



## addresses テーブル

| Column           | Type          | Options                        |
| ---------------- | ------------- | ------------------------------ |
| postal_code      | string        | null: false                    |
| prefecture       | integer       | null: false                    |
| city             | string        | null: false                    |
| house_number     | string        | null: false                    |
| building_name    | string        |                                |
| telephone_number | string        | null: false, foreign_key: true |
| order_history    | references    | null: false, foreign_key: true |

### Association
- belongs_to : order_histories

