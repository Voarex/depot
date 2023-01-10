xml.rss("version" => "2.0", "xmlns:dc" => "http://purl.org/dc/elements/1.1/") do
  for order in @product.orders
    xml.order do 
      xml.customer do
        xml.name order.name
        xml.email order.email
      end

      xml.id order.id
      xml.grand_total number_to_currency order.line_items.map(&:total_price).sum
      xml.pay_type order.pay_type

      for item in order.line_items
        xml.product item.product.title
        xml.quantity item.quantity
        xml.total_price (number_to_currency item.total_price)
      end
    end
  end
end
