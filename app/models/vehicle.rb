class Vehicle < ActiveRecord::Base
  obfuscate_id

  validates_presence_of :name
end
