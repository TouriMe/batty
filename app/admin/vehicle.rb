ActiveAdmin.register Vehicle do
  permit_params :name, :brand, :seat_number, :year
end
