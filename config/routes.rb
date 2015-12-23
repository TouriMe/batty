Rails.application.routes.draw do
  root 'welcome#index' 
  get 'tours/index'
  get 'tours/show'
  get 'drivers/index'
  get 'drivers/show' 
  get 'terms' => 'welcome#terms'
  get 'faq' => 'welcome#faq'
  get 'feedback' => 'welcome#feedback'
  get 'privacy' => 'welcome#privacy'
  get 'about' => 'welcome#about'
  post 'drivers' => 'drivers#find_drivers'
  
  resources :tourists, only: [:new, :show]
  resources :drivers, only: [:index, :show]
  resources :tours, :controller => "trips", only: [:index, :show ] 
  resources :guides, only: [:index, :show]
  resources :purchases, only: [:create, :edit,:update]
  resources :comments, only: [:create, :update, :destroy]

  namespace :api do
    resources :drivers, defaults: {format: :json}
  end

  get 'checkout/:id' => 'purchases#checkout'
  get 'book/:tour_id/:driver_id' => 'purchases#new'   
  get 'payment_success' => 'purchases#success'

  devise_for :normal_users, :controllers => { :omniauth_callbacks => 'auth/omniauth' }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
