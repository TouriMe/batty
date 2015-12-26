class AddReferenceIdToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :reference_id, :string
  end
end
