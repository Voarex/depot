class Order < ApplicationRecord
  # enum pay_type: {
  #   "Check"          => 0,
  #   "Credit card"    => 1,
  #   "Purchase order" => 2
  # }
  # has_one :pay_type
  has_many :line_items, dependent: :destroy
  # validates checkout input-fields
  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: PayType.all.ids
  
  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  def payment_type
    PayType.where(id: pay_type).first.try(:name)
  end
end
