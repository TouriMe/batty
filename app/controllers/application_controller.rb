class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  http_basic_authenticate_with name: 'tourime', password: 'great' if ENV['staging'] == 'YES'

  after_filter :store_location

  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    return unless request.get?
    if request.path != '/users/sign_in' &&
        request.path != '/users/sign_up' &&
        request.path != '/users/password/new' &&
        request.path != '/users/password/edit' &&
        request.path != '/users/confirmation' &&
        request.path != '/users/sign_out' &&
        !request.xhr? # don't store ajax calls
      session[:previous_url] = request.fullpath
    end
  end

  def after_sign_in_path_for(resource)
    puts 'after_sign_in_path_for: ', session[:previous_url]
    if session[:previous_url] == '/admin/login'
      admin_root_path
    else
      session[:previous_url] || root_path
    end
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
