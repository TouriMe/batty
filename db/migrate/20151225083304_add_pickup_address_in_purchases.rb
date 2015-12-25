class AddPickupAddressInPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :pickup, :string
  end
end
