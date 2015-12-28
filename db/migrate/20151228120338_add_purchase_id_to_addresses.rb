class AddPurchaseIdToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :purchase_id, :integer
  end
end
