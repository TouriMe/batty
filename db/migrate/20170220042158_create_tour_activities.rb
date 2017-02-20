class CreateTourActivities < ActiveRecord::Migration
  def change
    create_table :tour_activities do |t|
      t.references :tour, index: true, foreign_key: true
      t.references :activity, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
