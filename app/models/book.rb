class Book < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    [ "author", "created_at", "description", "id", "id_value", "price", "stock_quantity", "title", "updated_at" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "image_attachment", "image_blob", "cart_items", "categorizations", "categories", "order_items" ]
  end

  has_one_attached :image
  has_many :cart_items, dependent: :destroy
  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations
  has_many :order_items

  scope :newly_added, -> { where("created_at >= ?", 3.days.ago) }
  scope :recently_updated, -> { where("updated_at >= ?", 3.days.ago).where.not(id: newly_added) }

  validates :title, presence: true
  validates :author, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :stock_quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
