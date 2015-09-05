class Auth::OmniauthController < Devise::OmniauthCallbacksController
  def facebook
    @user = Tourist.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_tourist_path
    end
  end

  def failure
    flash[:error] = 'Failed to login via facebook'
    redirect_to root_path
  end
end
