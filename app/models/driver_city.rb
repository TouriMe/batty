class DriverCity < ActiveRecord::Base
  belongs_to :driver
  belongs_to :city
end
