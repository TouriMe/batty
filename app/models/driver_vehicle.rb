class DriverVehicle < ActiveRecord::Base
  belongs_to :driver
  belongs_to :vehicle

  scope :by_driver, -> (values) {where(driver_id: values).where.not(driver_id: nil, vehicle_id: nil)}
  
end
