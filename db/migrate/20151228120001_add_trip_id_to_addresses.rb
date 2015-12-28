class AddTripIdToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :trip_id, :integer
  end
end
