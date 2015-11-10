class AddImportantInfoToTrip < ActiveRecord::Migration
  def change
    add_column :trips, :important_info, :text
  end
end
