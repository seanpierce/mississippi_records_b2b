class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  belongs_to :user

  # validates :total_price, :status, presence: true
end
