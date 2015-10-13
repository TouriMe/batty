class AddStartDateToPurchase < ActiveRecord::Migration
  def change
    add_column :purchases, :start_date, :date
  end
end
