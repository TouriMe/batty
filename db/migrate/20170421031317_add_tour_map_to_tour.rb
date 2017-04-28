class AddTourMapToTour < ActiveRecord::Migration
  def change
  	add_column :tours, :tour_location, :string
  end
end
