Rails.application.routes.draw do
  root 'welcome#index'

  # @todo use static pages if possible
  get 'faq', to: 'welcome#faq'
  get 'about', to: 'welcome#about'
  get 'terms', to: 'welcome#terms'
  get 'privacy', to: 'welcome#privacy'
  get 'feedback', to: 'welcome#feedback'
  get 'maintenance', to: 'welcome#maintenance'

  # @todo weird route, change to search or else
  post 'drivers', to: 'drivers#find_drivers'

  resources :length
  resources :tours, only: [:index, :show ]
  resources :guides, only: [:index, :show]
  resources :drivers, only: [:index, :show]
  resources :tourists, only: [:new, :show]
  resources :purchases, only: [:create, :edit,:update]
  resources :comments, only: [:create, :update, :destroy]
  resources :articles, only: [:index, :show ]
  resources :blogs, only:[:index, :show ]

  namespace :api do
    resources :drivers, defaults: {format: :json}
  end

  # @todo messy routes, needs clean up
  get 'tour/:tour_id/drivers', to: 'tours#driver_selection', as: 'tour_driver'
  get 'book/:tour_id/:driver_id', to: 'purchases#new'
  get 'checkout/:id', to: 'purchases#checkout'
  get 'payment_success', to: 'purchases#success'
  get 'booking/:reference_id', to: 'bookings#show'

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :normal_users, controllers: { omniauth_callbacks: 'auth/omniauth' }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
