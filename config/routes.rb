Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'home#show'

  resources :offers
  resources :goods
  resource :about_us
  resource :contact_us
  resources :enterprise_dynamics
end
