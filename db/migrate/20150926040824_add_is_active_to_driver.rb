class AddIsActiveToDriver < ActiveRecord::Migration
  def change
    add_column :drivers, :is_active, :boolean, default: true
  end
end
