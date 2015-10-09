class CreateAddImageUrlToTrips < ActiveRecord::Migration
  def change
    create_table :add_image_url_to_trips do |t|
      t.string :image_url

      t.timestamps null: false
    end
  end
end
