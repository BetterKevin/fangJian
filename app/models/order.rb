class Order < ActiveRecord::Base
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items
  validates :start_time, presence: true

  default_scope { order(created_at: :desc) }  
end
