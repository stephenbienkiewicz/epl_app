Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  resources :clubs
  resources :locations
  resources :statuses

  root 'static_pages#home'
end
