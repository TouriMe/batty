class AddInternalUserToUsers < ActiveRecord::Migration
  def change
    add_column :users, :internal_user, :boolean, default: false
  end
end
