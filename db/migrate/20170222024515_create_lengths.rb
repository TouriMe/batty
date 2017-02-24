class CreateLengths < ActiveRecord::Migration
  def change
    create_table :lengths do |t|
      t.string :length_title

      t.timestamps null: false
    end
  end
end
