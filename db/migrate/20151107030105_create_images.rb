class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :imagable_type
      t.integer :imagable_id
      t.string :url
      t.string :alt_text

      t.timestamps null: false
    end
  end
end
