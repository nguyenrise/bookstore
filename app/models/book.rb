class Book < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    [ "author", "created_at", "description", "id", "id_value", "price", "stock_quantity", "title", "updated_at" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "image_attachment", "image_blob", "cart_items", "categorizations", "categories" ]
  end

  has_one_attached :image
  has_many :cart_items, dependent: :destroy
  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations
end
