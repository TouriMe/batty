class Driver < ActiveRecord::Base
  obfuscate_id

  has_many :languages, class_name: 'DriverLanguage'
  has_many :cities
  has_many :vehicles

  validates_presence_of :first_name, :last_name, :description, :phone

  accepts_nested_attributes_for :languages, :cities, :vehicles
end
