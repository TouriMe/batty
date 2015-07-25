Rails.application.routes.draw do
  namespace :api do
    resources :drivers, defaults: {format: :json}
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
