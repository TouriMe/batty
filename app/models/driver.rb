class Driver < ActiveRecord::Base
  obfuscate_id

  has_many :languages, class_name: 'DriverLanguage'
  has_many :driver_cities
  has_many :driver_vehicles

  has_many :cities, through: :driver_cities
  has_many :vehicles, through: :driver_vehicles

  validates_presence_of :first_name, :last_name, :phone
  # :description

  accepts_nested_attributes_for :languages, :driver_cities, :driver_vehicles, allow_destroy: true

  def full_name
    self.first_name + ' ' + self.last_name
  end
end
