require 'test_helper'

class CartTest < ActiveSupport::TestCase
  test "add two similar products to cart" do
    @cart = Cart.create
    @cart.add_product(products(:ruby).id).save!
    @cart.add_product(products(:ruby).id).save!
    assert_equal 1, @cart.line_items.size
    assert_equal 99.0, @cart.total_price
  end

  test "add two unique products to cart" do
    @cart = Cart.create
    @cart.add_product(products(:ruby).id).save!
    @cart.add_product(products(:two).id).save!
    assert_equal 2, @cart.line_items.size
    assert_equal 59.49, @cart.total_price
  end
end
