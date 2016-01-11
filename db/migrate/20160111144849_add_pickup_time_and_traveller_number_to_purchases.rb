class AddPickupTimeAndTravellerNumberToPurchases < ActiveRecord::Migration
  def change
    add_column Purchase, :pickup_time, :datetime
    add_column Purchase, :traveller_number, :integer
  end
end
