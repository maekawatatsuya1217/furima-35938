# テーブル設計

## users テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| nickname           | string     | null: false |
| email              | string     | null: false, unique: true |
| encrypted_password | string     | null: false |
| family_name        | string     | null: false |
| first_name         | string     | null: false |
| family_name_kana   | string     | null: false |
| first_name_kana    | string     | null: false |
| birthday           | date       | null: false |

### Association

- has_many :items
- has_many :histories


## items テーブル

| Column             | Type       | Options                        |
|------------------- | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| shipping_change_id | integer    | null: false                    |
| area_id            | integer    | null: false                    |     
| days_to_ship_id    | integer    | null: false                    | 
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :history


## destination テーブル

| Column        | Type      | Options                        |
| ------------- | --------- | ------------------------------ |
| post_number   | string    | null: false                    |
| area_id       | integer   | null: false                    |
| city          | string    | null: false                    |
| address       | string    | null: false                    |
| building_name | string    |                                |
| phone_number  | string    | null: false                    |
| history       | references| null: false, foreign_key: true |


### Association

- belongs_to :history

## historyテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
|user    | references | null: false, foreign_key: true |
|item    | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item
- has_one :destination
