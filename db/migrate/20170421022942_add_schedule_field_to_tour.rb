class AddScheduleFieldToTour < ActiveRecord::Migration
  def change
  	add_column :tours, :schedule, :text
  end
end
