class AddTypeToUser < ActiveRecord::Migration
  def change
    rename_table :admin_users, :users
    add_column :users, :type, :string
  end
end
