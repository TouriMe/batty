Rails.application.routes.draw do
  get 'tourists/new'

  get 'tourists/show'

  root 'welcome#index'
  get 'terms' => 'welcome#terms'
  get 'faq' => 'welcome#faq'
  get 'feedback' => 'welcome#feedback'
  get 'privacy' => 'welcome#privacy'
  get 'about' => 'welcome#about'

  devise_for :tourists, :controllers => { :omniauth_callbacks => 'auth/omniauth' }
  resources :tourists, only: [:new, :show]

  resources :drivers, only: [:index, :show]
  post 'drivers' => 'drivers#find_drivers'

  namespace :api do
    resources :drivers, defaults: {format: :json}
  end

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config
end
