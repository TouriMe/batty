class CreateDriverCities < ActiveRecord::Migration
  def change
    create_table :driver_cities do |t|
      t.integer :driver_id
      t.integer :city_id

      t.timestamps null: false
    end
  end
end
