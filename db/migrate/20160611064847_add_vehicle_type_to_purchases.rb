class AddVehicleTypeToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :vehicle_type, :string
  end
end
