class RemovePurchaseIdAndTripIdFromAddresses < ActiveRecord::Migration
  def change
    remove_column :addresses, :trip_id
    remove_column :addresses, :purchase_id
  end
end
