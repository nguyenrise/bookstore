# app/controllers/concerns/current_cart.rb
module CurrentCart
  private

  def set_cart
    if user_signed_in? && current_user.cart.present?
      @cart = current_user.cart
    elsif session[:cart_id]
      @cart = Cart.find_by(id: session[:cart_id])
      if @cart.nil?
        create_new_cart
      elsif user_signed_in?
        @cart.update(user: current_user)
      end
    else
      create_new_cart
    end
    session[:cart_id] = @cart.id
  end

  def create_new_cart
    @cart = Cart.create(user: current_user)
  end
end
