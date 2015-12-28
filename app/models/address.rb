class Address < ActiveRecord::Base
  has_many :purchases
end
