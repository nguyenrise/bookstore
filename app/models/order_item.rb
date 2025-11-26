class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :book

  def self.ransackable_attributes(auth_object = nil)
    [ "book_id", "created_at", "id", "order_id", "price", "quantity", "updated_at" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "book", "order" ]
  end
end
