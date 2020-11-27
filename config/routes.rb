Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  devise_scope :user do
    get '/users/auth/:provider/upgrade' => 'users/omniauth_callbacks#upgrade', as: :user_omniauth_upgrade
    get '/users/auth/:provider/setup', :to => 'users/omniauth_callbacks#setup'
  end
  
  root to: 'maps#index'
  resources :maps, only: [:index]

end
