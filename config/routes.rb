Rails.application.routes.draw do
  get 'contacts/index'
  get 'home/index'
  get 'articles/index'
  root 'home#index'
  resources :articles
  resources :contacts
  resources :comments
=begin
get 'articles/index'
get 'articles/new'
get 'articles/edit'
=end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end