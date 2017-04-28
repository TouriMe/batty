class AddTourTypeToTour < ActiveRecord::Migration
  def change
  	add_reference :tours, :tour_type, index: true, foreign_key: true
  end
end
