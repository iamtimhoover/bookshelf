Books::Application.routes.draw do
  get 'books/search', to: 'books#search', as: 'books_search'
  resources :books
end
