class NormalUser < User
  devise :omniauthable, :omniauth_providers => [:facebook, :google_oauth2]
  has_one :driver
  has_one :tourist

  def self.from_omniauth(auth)
    @user = find_by(email: auth.info.email)
    return @user if @user

    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      email = auth.info.email ? auth.info.email : "user-#{auth.uid}@#{auth.provider}.com"
      user.email = email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
    end
  end
end