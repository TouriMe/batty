class AddRatingToDriver < ActiveRecord::Migration
  def change
    add_column :drivers, :rating, :decimal
    add_column :trips, :rating, :decimal
  end
end
