class AddAddressIdToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :address_id, :integer
  end
end
