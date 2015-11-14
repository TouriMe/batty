class AddRatingToDriver < ActiveRecord::Migration
  def change
    add_column :drivers, :rating, :float
    add_column :trips, :rating, :float
  end
end
