class AddFirstNameAndLastNameToPurchases < ActiveRecord::Migration
  def change
    add_column Purchase, :first_name, :string
    add_column Purchase, :last_name, :string
  end
end
