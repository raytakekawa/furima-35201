class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :shipping_cost
  belongs_to :shipping_days
  belongs_to :status
  belongs_to :user
  has_one_attached :image

  validates :name, :description, :price, :category_id, :shipping_cost_id, :prefecture_id, :shipping_days_id, :status_id, presence: true
  validates :category_id, :shipping_cost_id, :prefecture_id, :shipping_days_id, :status_id, numericality: { other_than: 1 } 
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :price, format: { with: /\A[0-9]+\z/ }

end
