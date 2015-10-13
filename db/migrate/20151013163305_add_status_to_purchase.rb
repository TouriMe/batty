class AddStatusToPurchase < ActiveRecord::Migration
  def change
    add_column :purchases, :status, :integer
    add_column :purchases, :email, :string
  end
end
