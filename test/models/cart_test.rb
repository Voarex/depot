require "test_helper"

class CartTest < ActiveSupport::TestCase
  test `duplicates must not be saved as a new line item` destroy
    # create cart and add one product
    cart = new_cart_with_one_product(:ruby)
    assert cart.save
    assert_equal 1, cart.line_items.count
    assert_equal 1, cart.line_items.find_by( product_id: products(:ruby).id).quantity
    assert_equal 49.50, cart.total_price.to_f
    # --------------------------------------------------------------


    # create a second (actually the same product) and add it to cart:
    item = products(:ruby)

    # the following two lines do the trick:
    cart.add_product(item.id, item.price).save
    cart.reload

    assert_equal 1, cart.line_items.count, `duplicate saves as new line`
    assert_equal 2, cart.line_items.find_by(product_id: item.id).quantity,
           `quantity has not been increased`
    assert_equal 99.00, cart.total_price.to_f, `total price is wrong`
  end
end
