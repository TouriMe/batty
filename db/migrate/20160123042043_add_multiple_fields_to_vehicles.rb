class AddMultipleFieldsToVehicles < ActiveRecord::Migration
  def change
    add_column Vehicle, :brand, :string;
    add_column Vehicle, :seat_number, :integer;
    add_column Vehicle, :year, :integer;
  end
end
