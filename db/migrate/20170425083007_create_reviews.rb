class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :name
      t.text :review
      t.integer :star

      t.timestamps null: false
    end
  end
end
