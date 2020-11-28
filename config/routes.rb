Rails.application.routes.draw do

  root to: 'maps#index'
  resources :maps, only: [:index]

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  get "users/show" => "users#show"
  get '/mypage' => 'users#mypage'

  devise_scope :user do
    get '/users/auth/:provider/upgrade' => 'users/omniauth_callbacks#upgrade', as: :user_omniauth_upgrade
    get '/users/auth/:provider/setup', :to => 'users/omniauth_callbacks#setup'
  end

end
