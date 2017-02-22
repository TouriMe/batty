class City < ActiveRecord::Base
  obfuscate_id

  has_many :driver_cities, :dependent => :destroy
  has_many :drivers, through: :driver_cities

  validates_presence_of :name
end
