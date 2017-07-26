class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  belongs_to :user
  before_save :update_total
  before_create :update_status

  # validates :total_price, :status, presence: true

  def total_price
    self.total_price = self.order_items.collect { |item| item.album.price * item.quantity }.sum
  end

  def calculate_total
    self.order_items.collect { |item| item.album.price * item.quantity }.sum
  end

private
  def update_status
    if self.status == nil?
      self.status = "In progress"
    end
  end

  def update_total
    self.order_items.collect { |item| item.album.price * item.quantity }.sum
  end
end
