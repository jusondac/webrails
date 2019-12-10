Rails.application.routes.draw do
  root 'home#index'
  resources :contacts
  get "sign_up" => "users#new",:as => "sign_up"
  resources :users
  resources :sessions
  resources :articles do
    resources :comments
  end
end
