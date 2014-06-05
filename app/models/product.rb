class Product < ActiveRecord::Base
  has_many :order_items
  has_many :orders, through: :order_items
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :name, presence: true, uniqueness: true
end
