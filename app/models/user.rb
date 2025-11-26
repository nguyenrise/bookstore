class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :cart, dependent: :destroy
  has_many :orders

  def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "email", "id", "updated_at", "address", "phone_number" ]
  end
end
