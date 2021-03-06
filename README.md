# README

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname |string  |null: false  |
|email    |string  |null: false, unique: true  |
|encrypted_password |string  |null:false  |
|last_name  |string  |null: false  |
|first_name   |string  |null: false  |
|last_name_kana  |string  |null: false  |
|first_name_kana  |string  |null: false  |
|birth_date  |date  |null: false  |


### Association
has_many :items
has_many :orders




## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name  |string  |null: false  |
|description  |text  |null: false  |
|category_id  |integer  |null: false |
|status_id  |integer  |null: false  |
|shipping_cost_id  |integer  |null: false  |
|prefecture_id |integer  |null: false  |
|shipping_days_id  |integer  |null: false  |
|price  |integer  |null: false  |
|user_id  |integer  |null: false, foreign_key: true  |


### Association
belongs_to :user
has_one :order





## destinationsテーブル

|Column|Type|Options|
|------|----|-------|
|post_code  |string  |null: false  |
|prefecture_id  |integer  |null: false  |
|city  |string  |null: false  |
|address  |string  |null: false  |
|building_name  |string  |  |
|phone_number  |string  |null: false  |
|order_id  |integer  |null: false, foreign_key: true  |



### Association
belongs_to :order




## ordersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id  |integer  |null: false, foreign_key: true  |
|item_id  |integer  |null: false, foreign_key: true  |


### Association
belongs_to :user
belongs_to :item
has_one :destination
