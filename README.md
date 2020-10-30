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

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| last_name          | string  | null: false |
| first_name         | string  | null: false |
| last_name_kana     | string  | null: false |
| first_name_kana    | string  | null: false |
| birthday           | date    | null: false |

### Association

- has_many :items
- has_many :purchases


## itemsテーブル

| Column                         | Type       | Options           |
| ------------------------------ | ---------- | ----------------- |
| name                           | string     | null: false       |
| description                    | text       | null: false       |
| category_id                    | integer    | null: false       |
| condition_id                   | integer    | null: false       |
| charge_of_distribution_cost_id | integer    | null: false       |
| forwarding_origin_id           | integer    | null: false       |
| before_forward_date_id         | integer    | null: false       |
| price                          | integer    | null: false       |
| user                           | references | foreign_key: true |
- imageはActiveStorageで実装

### Association

- belongs_to :user
- has_one    :purchase


## purchases テーブル

| Column  | Type        | Options           |
| ------- | ----------- | ----------------- |
| user    | references  | foreign_key: true |
| item    | references  | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :delivery_information


## delivery_information テーブル

| Column        | Type       | Options           |
| ------------- | ---------- | ----------------- |
| zip_code      | string     | null: false       |
| prefecture_id | integer    | null: false       |
| municipality  | string     | null: false       |
| address       | string     | null: false       |
| building_name | string     | --                |
| phone_number  | string     | null: false       |
| purchase      | references | foreign_key: true |

### Association

- belongs_to :purchase