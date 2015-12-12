class AddSomeColumnsToTrips < ActiveRecord::Migration
  def change
    add_column :purchases, :email_confirmation, :string 
    add_column :purchases, :country_code, :string 
    add_column :purchases, :phone_number, :string 
  end
end
