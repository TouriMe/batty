class AddCardImageToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :card_img, :string
  end
end
