class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  validates :amount, presence: true 
  validates :product_id, presence: true
  validates_numericality_of :amount, greater_than: 0
end
