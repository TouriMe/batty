class AddingAttrsToDriversTable < ActiveRecord::Migration
  def change
    add_column :drivers, :driving_years, :integer
  end
end
