class CreateDriverComments < ActiveRecord::Migration
  def change
    create_table :driver_comments do |t|
      t.integer :tourist_id
      t.integer :driver_id
      t.string :message
      t.integer :rating

      t.timestamps null: false
    end
  end
end
