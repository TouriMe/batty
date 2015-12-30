class Address < ActiveRecord::Base
  has_many :purchases
  validates :name, uniqueness: true
end
