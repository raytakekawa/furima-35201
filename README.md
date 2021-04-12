# README

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname |string  |null: false  |
|email    |string  |null: false  |
|encrypted_password |string  |null:false  |
|user_image   |string  |         |
|introduction |text    |         |
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
|price  |string  |null: false  |
|description  |string  |null: false  |
|status  |string  |null: false  |
|size  |string  |null: false  |
|shipping_fee  |string  |null: false  |
|shipping_days  |string  |null: false  |
|prefecture_id |string  |null: false  |
|category_id  |integer  |null: false, foreign_key: true  |
|brand_id  |integer  |null: false, foreign_key: true  |
|shipping_id  |integer  |null: false, foreign_key: true  |
|user_id  |integer  |null: false, foreign_key: true  |


### Association
belongs_to :users
belongs_to :categories
belongs_to :brands
belongs_to :items_images




## destinationsテーブル

|Column|Type|Options|
|------|----|-------|
|family_name  |string  |null: false  |
|first_name  |string  |null: false  |
|family_name_kana  |string  |null: false  |
|first_name_kana  |string  |null: false  |
|post_code  |string  |null: false  |
|prefecture  |string  |null: false  |
|city  |string  |null: false  |
|address  |string  |null: false  |
|building_name  |string  |  |
|phone_number  |string  |  |


### Association
belongs_to :users
has_many :items_images




## cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id  |integer  |null: false, foreign_key: true  |
|purchase_id  |string  |null: false  |
|card_id  |string  |null: false  |


### Association
belongs_to :users





## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name  |string  |null: false|
|ancestry  |string  |null: false|


### Association
has_many :items




## items_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|items_image  |string  |null: false  |
|item_id  |integer  |null: false  |


### Association
belongs_to :destination




## brandテーブル

|Column|Type|Options|
|------|----|-------|
|name  |string  |index: true  |


### Association
has_many :items









