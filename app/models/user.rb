class User < ActiveRecord::Base
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.from_omniauth(auth)
    @tourist = find_by(email: auth.info.email)
    return @tourist if @tourist

    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      email = auth.info.email ? auth.info.email : "user-#{auth.uid}@#{auth.provider}.com"
      user.email = email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
    end
  end
end