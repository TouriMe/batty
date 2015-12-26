class AddCardImageToDrivers < ActiveRecord::Migration
  def change
    add_column :drivers, :card_img, :string
  end
end
