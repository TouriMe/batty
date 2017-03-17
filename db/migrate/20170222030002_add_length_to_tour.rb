class AddLengthToTour < ActiveRecord::Migration
  def change
    add_reference :tours, :length, index: true, foreign_key: true
  end
end
