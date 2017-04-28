class AddCustomerNameToReview < ActiveRecord::Migration
  def change
  	add_column :reviews, :customer_name, :string
  end
end
