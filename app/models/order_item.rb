class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :product_id, presence: true
end
