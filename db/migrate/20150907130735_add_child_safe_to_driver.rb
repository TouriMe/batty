class AddChildSafeToDriver < ActiveRecord::Migration
  def change
    add_column :drivers, :childsafe, :boolean
  end
end
