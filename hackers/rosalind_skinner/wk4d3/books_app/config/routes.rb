Rails.application.routes.draw do

  resources :authors
  resources :books

end


# authors_path   GET   /authors(.:format)  authors#index
# POST   /authors(.:format)  authors#create
# new_author_path  GET   /authors/new(.:format)  authors#new
# edit_author_path   GET   /authors/:id/edit(.:format)   authors#edit
# author_path  GET   /authors/:id(.:format)  authors#show
# PATCH  /authors/:id(.:format)  authors#update
# PUT  /authors/:id(.:format)  authors#update
# DELETE   /authors/:id(.:format)  authors#destroy

# books_path   GET   /books(.:format)  books#index
# POST   /books(.:format)  books#create
# new_book_path  GET   /books/new(.:format)  books#new
# edit_book_path   GET   /books/:id/edit(.:format)   books#edit
# book_path  GET   /books/:id(.:format)  books#show
# PATCH  /books/:id(.:format)  books#update
# PUT  /books/:id(.:format)  books#update
# DELETE   /books/:id(.:format)  books#destroy

