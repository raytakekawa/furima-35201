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
has_one :cards
has_one :destinations




## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name  |string  |null: false  |
|price  |integer  |null: false  |
|description  |text  |null: false  |
|status  |string  |null: false  |
|size  |string  |null: false  |
|shipping_fee  |string  |null: false  |
|shipping_days  |string  |null: false  |
|prefecture_id |string  |null: false  |
|category_id  |integer  |null: false |
|brand_id  |integer  |null: false  |
|shipping_id  |integer  |null: false  |
|user_id  |integer  |null: false  |


### Association
belongs_to :users





## destinationsテーブル

|Column|Type|Options|
|------|----|-------|
|post_code  |string  |null: false  |
|prefecture  |string  |null: false  |
|city  |string  |null: false  |
|address  |string  |null: false  |
|building_name  |string  |  |
|phone_number  |string  |  |


### Association
belongs_to :users



## cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id  |integer  |null: false, foreign_key: true  |
|purchase_id  |string  |null: false  |
|card_id  |string  |null: false  |


### Association
belongs_to :users