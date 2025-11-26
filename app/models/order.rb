class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :books, through: :order_items

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "total", "updated_at", "user_id", "status", "address", "phone_number"]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "order_items", "user" ]
  end
end
