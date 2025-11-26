class Book < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    [ "author", "created_at", "description", "id", "id_value", "price", "stock_quantity", "title", "updated_at" ]
  end

  has_one_attached :image
end
