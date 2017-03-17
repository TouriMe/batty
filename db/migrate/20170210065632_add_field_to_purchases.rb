class AddFieldToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :latlng, :string
  end
end
