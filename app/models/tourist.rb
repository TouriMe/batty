class Tourist < NormalUser
  has_many :driver_comments
  has_many :trip_comments
end

