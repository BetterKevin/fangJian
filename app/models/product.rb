class Product < ActiveRecord::Base
  has_many :order_items
  has_many :orders, through: :order_items
  belongs_to :category
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :name, presence: true, uniqueness: true
  validates :category_id, presence: true
end
