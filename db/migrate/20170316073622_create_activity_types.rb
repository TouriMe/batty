class CreateActivityTypes < ActiveRecord::Migration
  def change
    create_table :activity_types do |t|
      t.string :name
      t.references :activity, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
