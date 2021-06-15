# テーブル設計

## users テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| nickname           | string     | null: false |
| email              | string     | null: false |
| password           | string     | null: false |
| family_name        | string     | null: false |
| first_name         | string     | null: false |
| family_name_kana   | string     | null: false |
| first_name_kana    | string     | null: false |
| destination        | string     | null: false |
| birthday           | YYYY-MM-DD | null: false |

### Association

- belongs_to :item
- has_one :histories


## items テーブル

| Column           | Type       | Options                        |
|----------------- | ---------- | ------------------------------ |
| image            | string     | null: false                    |
| name             | string     | null: false                    |
| description      | text       | null: false                    |
| category         | string     | null: false                    |
| status           | string     | null: false                    |
| shipping_changes | string     | null: false                    |
| area             | string     | null: false                    |     
| days_to_ship     | integer    | null: false                    | 
| price            | string     | null: false                    |
| fee              | integer    | null: false                    |
| profit           | integer    | null: false                    |
| user_id          | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :destination
- has_one :history


## destination テーブル

| Column        | Type   | Options                        |
| ------------- | ------ | ------------------------------ |
| post_number   | string | null: false                    |
| prefecture    | string | null: false                    |
| city          | string | null: false                    |
| address       | string | null: false                    |
| building_name | string |                                |
| phone_number  | string | null: false                    |
| user_id       | string | null: false, foreign_key: true |


### Association

- belongs_to :item

## historyテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
|user_id        | references | null: false, foreign_key: true |
|item_id        | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item
