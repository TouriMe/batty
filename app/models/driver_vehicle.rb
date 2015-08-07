class DriverVehicle < ActiveRecord::Base
  belongs_to :driver
  belongs_to :vehicle
end
