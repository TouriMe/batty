class City < ActiveRecord::Base
  obfuscate_id

  has_many :driver_cities
  has_many :drivers, through: :driver_cities

  validates_presence_of :name
end
