Rails.application.routes.draw do
  get 'home/index'
  get 'contact_us/index'
  get 'articles/index'
  root 'home#index'
  resources :articles	
  resources :contact_us
=begin
get 'articles/index'
get 'articles/new'
get 'articles/edit'
=end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
