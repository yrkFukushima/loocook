# README

## users テーブル

| Column             | Type   | Options                 |
| ------------------ | ------ | ----------------------- |
| nickname               | string | null: false             |
| email              | string | null: false, unique:true|
| encrypted_password | string | null: false             |

### Association
- has_many :dishes


## dishesテーブル
| Column             | Type   | Options                            |
| ------------------ | ------ | ---------------------------------- |
| dish_1             | string | null: false                        |
| dish_2             | string |                                    |
| dish_3             | string |                                    |
| dish_4             | string |                                    |
| dish_5             | string |                                    |
| user               | references | null: false, foreign_key: true |

### Association
- has_one :user

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

* ...
