class AddSlugToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :slug, :string , unique: true
  end
end
