class AddTouristInfoToPaymentTable < ActiveRecord::Migration
  def change
    add_column :purchases, :country, :string
    add_column :purchases, :contact, :string
  end
end
