class CreateDriverVehicles < ActiveRecord::Migration
  def change
    create_table :driver_vehicles do |t|
      t.integer :driver_id
      t.integer :vehicle_id

      t.timestamps null: false
    end
  end
end
