class AddTourIdToPurchases < ActiveRecord::Migration
  def change
    add_column Purchase, :tour_id, :integer
  end
end
