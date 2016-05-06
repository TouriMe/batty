class ChangeIsActiveToFalseToTours < ActiveRecord::Migration
  def change
    change_column :tours, :is_active, :boolean, default: false
  end
end
