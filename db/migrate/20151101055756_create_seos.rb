class CreateSeos < ActiveRecord::Migration
  def change
    create_table :seos do |t|
      t.string :title
      t.string :description
      t.string :keywords
      t.string :author

      t.timestamps null: false
    end
  end
end
