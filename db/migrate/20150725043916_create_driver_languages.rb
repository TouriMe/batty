class CreateDriverLanguages < ActiveRecord::Migration
  def change
    create_table :driver_languages do |t|
      t.integer :driver_id
      t.string :language_code
      t.integer :proficiency

      t.timestamps null: false

      t.index :language_code
    end
  end
end
