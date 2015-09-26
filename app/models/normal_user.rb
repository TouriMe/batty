class NormalUser < User
  devise :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]
  has_one :driver

end