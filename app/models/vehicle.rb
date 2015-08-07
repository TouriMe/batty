class Vehicle < ActiveRecord::Base
  obfuscate_id

  has_many :driver_vehicles
  has_many :drivers, through: :driver_vehicles

  validates_presence_of :name
end
