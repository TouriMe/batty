class AddIntoToPayment < ActiveRecord::Migration
  def change
    add_column :purchases, :driver_id, :integer
    add_column :purchases, :vehicle_id, :integer
    add_column :purchases, :comments, :text
  end
end
