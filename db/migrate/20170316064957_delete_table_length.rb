class DeleteTableLength < ActiveRecord::Migration
  def up
  	execute "ALTER TABLE tours DROP length_id"
    drop_table :lengths

  end
 
  def down
    create_table :lengths do |t|
      t.string :length_title

      t.timestamps null: false
    end
    add_reference :tours, :length, index: true, foreign_key: true
  end
end
