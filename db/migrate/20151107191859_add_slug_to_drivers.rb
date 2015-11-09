class AddSlugToDrivers < ActiveRecord::Migration
  def change
    add_column :drivers, :slug, :string, unique: true
  end
end
