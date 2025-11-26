class CartItem < ApplicationRecord
  belongs_to :book
  belongs_to :cart

  def self.ransackable_attributes(auth_object = nil)
    ["book_id", "cart_id", "created_at", "id", "id_value", "quantity", "updated_at"]
  end
end
