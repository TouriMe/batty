class Driver < ActiveRecord::Base
  obfuscate_id

  belongs_to :normal_user

  has_many :languages, class_name: 'DriverLanguage'
  has_many :driver_cities
  has_many :driver_vehicles

  has_many :cities, through: :driver_cities
  has_many :vehicles, through: :driver_vehicles

  has_many :comments, as: :commentable

  validates_presence_of :first_name, :phone

  scope :active, ->{where(is_active: true)}

  accepts_nested_attributes_for :languages, :driver_cities, :driver_vehicles, allow_destroy: true

  def full_name
    self.first_name + ' ' + self.last_name
  end

  def rating
    nums = comments.map(&:rating)
    return nil if nums.empty?
    nums.sum.to_f / nums.count
  end

  has_many :purchases, as: :purchasable
end
