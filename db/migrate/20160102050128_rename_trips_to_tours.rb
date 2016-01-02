class RenameTripsToTours < ActiveRecord::Migration
  def change
    rename_table :trips, :tours
  end
end
