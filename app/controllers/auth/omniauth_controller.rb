class Auth::OmniauthController < Devise::OmniauthCallbacksController
  [ [:facebook, 'Facebook', 'devise.facebook_data'],
    [:google_oauth2 , 'Google', 'devise.google_data']
  ].each do |provider, kind, session_name|
    define_method provider do
      @tourist = Tourist.from_omniauth(request.env["omniauth.auth"])

      if @tourist.persisted?
        sign_in_and_redirect @tourist, :event => :authentication
        # set_flash_message(:notice, :success, :kind => kind) if is_navigational_format?
      else
        puts @tourist.errors
        session[session_name] = request.env["omniauth.auth"]
        redirect_to new_tourist_path
      end
    end
  end

  def failure
    flash[:error] = 'Failed to login via OpenID'
    redirect_to root_path
  end
end
