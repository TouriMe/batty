class CreateGuides < ActiveRecord::Migration
  def change
    create_table :guides do |t|
      t.string :city
      t.string :contact
      t.monetize :daily_price

      t.timestamps null: false
    end
  end
end
