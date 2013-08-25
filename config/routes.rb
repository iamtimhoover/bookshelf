Books::Application.routes.draw do
  get 'books/new', to: 'books#new', as: 'books_new'
  resources :books
end
