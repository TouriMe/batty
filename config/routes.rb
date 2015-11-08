Rails.application.routes.draw do
  get 'trips/index'

  get 'trips/show'

  get 'drivers/index'

  get 'drivers/show'

  root 'welcome#index'
  get 'terms' => 'welcome#terms'
  get 'faq' => 'welcome#faq'
  get 'feedback' => 'welcome#feedback'
  get 'privacy' => 'welcome#privacy'
  get 'about' => 'welcome#about'
  get 'tourists/new'
  get 'tourists/show'
 
  post 'drivers' => 'drivers#find_drivers'
  
  resources :tourists, only: [:new, :show]
  resources :drivers, only: [:index, :show]
  resources :trips, only: [:index, :show ]
  
  resources :guides, only: [:index, :show]
  resources :purchases, only: [:create, :edit,:update]
  resources :comments, only: [:create, :update, :destroy]

  namespace :api do
    resources :drivers, defaults: {format: :json}
  end

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :normal_users, :controllers => { :omniauth_callbacks => 'auth/omniauth' }
end
