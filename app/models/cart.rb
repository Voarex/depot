class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def add_product(product)
    current_item = line_items.find_by(product_id: product.id)
    if current_item
      current_item.quantity += 1
    else
      # create a new line_item
      current_item = line_items.build(product_id: product.id, price: product.price)
    end
    current_item
  end

  def delete_product(product)
    current_item = line_items.find_by(product_id: product.id)
    if current_item != nil && current_item.quantity >= 2
      current_item.quantity -= 1
    elsif current_item != nil
      # delete a line_item in cart  
      current_item.destroy
    end
    current_item
  end

  def total_price
    line_items.sum { |item| item.total_price }
  end
end
 