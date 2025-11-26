class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :books, through: :cart_items
  belongs_to :user, optional: true

  def total_price
    cart_items.sum { |item| item.book.price * item.quantity }
  end
end
