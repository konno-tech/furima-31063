# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* テーブル設計
## usersテーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| last_name_full  | string  | null: false |
| first_name_full | text    | null: false |
| last_name_half  | text    | null: false |
| first_name_half | text    | null: false |
| birthday        | date    | null: false |

### Association

- has_many :items
- has_many :purchases


## itemsテーブル

| Column                      | Type       | Options     |
| --------------------------- | ---------- | ----------- |
| name                        | string     | null: false |
| description                 | text       | null: false |
| category                    | string     | null: false |
| condition                   | string     | null: false |
| charge_of_distribution_cost | integer    | null: false |
| forwarding_origin           | string     | null: false |
| before_forward_date         | date       | null: false |
| favorite_count              | integer    | null: false |
| user                        | references | --          |
- imageはActiveStorageで実装

### Association

- belongs_to :user
- has_one    :purchase


## purchases テーブル

| Column  | Type        | Options     |
| ------- | ----------- | ----------- |
| user    | references  | --          |
| item    | references  | --          |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :delivery_information


## delivery_information テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| zip_code      | string     | null: false |
| prefecture    | string     | null: false |
| municipality  | string     | null: false |
| address       | string     | null: false |
| building_name | string     | --          |
| phone_number  | integer    | null: false |
| purchase      | references | --          |

### Association

- belongs_to :purchase