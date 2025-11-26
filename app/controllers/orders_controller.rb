class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    @order = current_user.orders.build
    @order.total = @cart.cart_items.sum { |item| item.book.price * item.quantity }

    if @order.save
      @cart.cart_items.each do |item|
        @order.order_items.create(book: item.book, quantity: item.quantity, price: item.book.price)
      end
      @cart.cart_items.destroy_all
      redirect_to root_path, notice: "Order was successfully created."
    else
      redirect_to cart_path, alert: "There was an error creating your order."
    end
  end
end
