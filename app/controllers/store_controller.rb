class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart
  before_action :session_counter

  def index
    @products = Product.order(:title)
  end
end
