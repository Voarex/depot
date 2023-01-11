
json.array! @product.orders do |order|
   json.order do

    json.customer do
      json.name order.name
      json.email order.email
    end

    json.id order.id
    json.grand_total number_to_currency order.line_items.map(&:total_price).sum
    json.pay_type order.payment_type

    json.items order.line_items do |item|
      json.product item.product.title
      json.quantity item.quantity
      json.total_price (number_to_currency item.total_price)
    end
  end
end
