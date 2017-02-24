class CreateTourDrivers < ActiveRecord::Migration
  def change
    create_table :tour_drivers do |t|
      t.references :tour, index: true, foreign_key: true
      t.references :driver, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
