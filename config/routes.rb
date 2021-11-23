Rails.application.routes.draw do
  get 'books/index', as: 'books'
  get 'books/:id' => 'books#show',as: 'book'
  get 'books/:id/edit' => 'books#edit', as: 'edit_book'
  get 'homes/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'books' => 'books#create'
  patch 'books/:id' => 'books#update', as:'update_book'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'

  root to: 'homes#index'
end
