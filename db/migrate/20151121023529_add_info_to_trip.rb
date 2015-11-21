class AddInfoToTrip < ActiveRecord::Migration
  def change
    add_column :trips, :distance, :integer
    add_column :trips, :checkpoint_num, :integer
    add_column :trips, :duration, :string
  end
end
