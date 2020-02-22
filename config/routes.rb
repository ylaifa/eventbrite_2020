Rails.application.routes.draw do
  devise_for :users 
  resources :profiles
  resources :events

  post "events/subscribe/:id", to: "subscribes#create", as: "subscribes"
 
  root 'events#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
