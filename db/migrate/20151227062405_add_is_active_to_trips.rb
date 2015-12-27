class AddIsActiveToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :is_active, :boolean, default: true
  end
end
