class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :purchasable_id
      t.string :purchasable_type
      t.decimal :price
      t.integer :buyer_id

      t.timestamps null: false
    end
  end
end
