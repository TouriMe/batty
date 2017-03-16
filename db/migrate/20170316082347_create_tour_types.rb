class CreateTourTypes < ActiveRecord::Migration
  def change
    create_table :tour_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
