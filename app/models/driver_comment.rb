class DriverComment < ActiveRecord::Base
  belongs_to :normal_user
  belongs_to :driver

  validates_presence_of :message, :rating, :driver, :normal_user
end
