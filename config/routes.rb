Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      post 'users', to: 'users#create'
      post 'login', to: 'users#login'
      get 'users', to: 'users#show'
    end
  end
end
