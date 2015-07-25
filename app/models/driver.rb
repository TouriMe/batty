class Driver < ActiveRecord::Base
  obfuscate_id

  has_many :languages, class_name: 'DriverLanguage'

  validates_presence_of :first_name, :last_name, :description, :phone

  accepts_nested_attributes_for :languages
end
