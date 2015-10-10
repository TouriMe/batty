class CreateTripComments < ActiveRecord::Migration
  def change
    create_table :trip_comments do |t|
      t.string :tourist_id
      t.string :trip_id
      t.string :message
    end
  end
end
