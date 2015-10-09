class AddImageUrlToTrip < ActiveRecord::Migration
  def change
    add_column :trips, :image_url, :string
  end
end
