Rails.application.routes.draw do
  root 'welcome#hello'
  resources :users
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  resources :book_shelves
  resources :genres, only: [:index, :show]
  resources :reviews
  resources :books
  resources :authors, only: [:index, :show]
  resources :shelves
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
