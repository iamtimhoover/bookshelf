Books::Application.routes.draw do
  devise_for :users
  root "books#index"
  get 'books/search', to: 'books#search', as: 'books_search'
  resources :books
end
