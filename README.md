# README

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname |string  |null: false  |
|email    |string  |null: false, unique: true  |
|encrypted_password |string  |null:false  |
|family_name  |string  |null: false  |
|first_name   |string  |null: false  |
|family_name_kana  |string  |null: false  |
|first_name_kana  |string  |null: false  |
|birth_day  |date  |null: false  |


### Association
has_many :items
has_one :destinations
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
|user_id  |integer  |null: false, foreign: key  |
|purchase_id  |integer  |null: false, foreign: key  |



### Association
belongs_to :users
has_one :orders





## destinationsテーブル

|Column|Type|Options|
|------|----|-------|
|post_code  |string  |null: false  |
|prefecture_id  |integer  |null: false  |
|city  |string  |null: false  |
|address  |string  |null: false  |
|building_name  |string  |  |
|phone_number  |string  |null: false  |


### Association
belongs_to :users




## ordersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id  |integer  |null: false, foreign: key  |
|items_id  |integer  |null: false, foreign: key  |


### Association
belongs_to :users
belongs_to :items
