class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :name
      t.text :content
      t.money :price_cent

      t.timestamps null: false
    end
  end
end
