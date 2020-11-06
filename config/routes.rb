Rails.application.routes.draw do
  get 'searches',to: "searches#index"
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
   omniauth_callbacks: 'users/omniauth_callbacks',
   registrations: 'users/registrations'
  }
  post '/callback' => 'linebot#callback'
  get 'homes/index'
  resources :homes, only: [:index]
  root to: 'home#index'
  resources :users 
  resources :attendances
  resources :restaurants, only: [:index, :show] 
  resources :searches do
    collection do
      get 'search'
    end
  end
  namespace :admin do
    resources :restaurants, only: [:index, :new, :create, :show,  :edit, :destroy]
  end
end
  

