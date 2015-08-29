Rails.application.routes.draw do
  root 'welcome#index'
  resources :drivers, only: [:index, :show]
  post 'drivers' => 'drivers#find_drivers'

  namespace :api do
    resources :drivers, defaults: {format: :json}
  end

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config
end
