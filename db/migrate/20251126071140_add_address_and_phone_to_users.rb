class AddAddressAndPhoneToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :address, :text
    add_column :users, :phone_number, :string
  end
end
