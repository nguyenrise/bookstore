class OrdersController < ApplicationController
  include CurrentCart
  before_action :authenticate_user!
  before_action :set_cart, only: [ :create ]

  def index
    @orders = current_user.orders.includes(order_items: :book).order(created_at: :desc)
  end

  def new
    @order = current_user.orders.build
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.total = @cart.total_price

    if @order.save
      # Save address and phone number to user if they don't have one
      current_user.update(address: @order.address, phone_number: @order.phone_number) if current_user.address.blank?

      @cart.cart_items.each do |item|
        @order.order_items.create(book: item.book, quantity: item.quantity, price: item.book.price)
      end

      @cart.cart_items.destroy_all
      redirect_to root_path, notice: "Order was successfully placed."
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:address, :phone_number)
  end
end
