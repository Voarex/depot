module CurrentCart
  
  private

    def session_counter
      if session[:counter].nil?
        session[:counter] = 0
      end

      session[:counter] += 1
      @session_counter = session[:counter]
    end

    def set_cart
      @cart = Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end