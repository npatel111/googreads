Rails.application.routes.draw do
  resources :book_shelves
  resources :genres
  resources :reviews
  resources :books
  resources :authors
  resources :shelves
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
