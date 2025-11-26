class CartItemsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    @cart_item = @cart.cart_items.find_or_initialize_by(book: book)
    
    if @cart_item.new_record?
      @cart_item.quantity = 1
    else
      @cart_item.quantity += 1
    end
    
    @cart_item.save
    redirect_to @cart
  end
end
