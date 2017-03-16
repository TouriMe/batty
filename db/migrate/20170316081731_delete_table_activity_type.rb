class DeleteTableActivityType < ActiveRecord::Migration
  def up
    drop_table :activity_types
  end
end
