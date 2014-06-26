Rails.application.routes.draw do
  root :to => 'authors#home'
  resources :authors
  resources :books
end


# author_index_path  GET   /author(.:format)   author#index
# POST   /author(.:format)   author#create
# new_author_path  GET   /author/new(.:format)   author#new
# edit_author_path   GET   /author/:id/edit(.:format)  author#edit
# author_path  GET   /author/:id(.:format)   author#show
# PATCH  /author/:id(.:format)   author#update
# PUT  /author/:id(.:format)   author#update
# DELETE   /author/:id(.:format)   author#destroy
# book_index_path  GET   /book(.:format)   book#index
# POST   /book(.:format)   book#create
# new_book_path  GET   /book/new(.:format)   book#new
# edit_book_path   GET   /book/:id/edit(.:format)  book#edit
# book_path  GET   /book/:id(.:format)   book#show
# PATCH  /book/:id(.:format)   book#update
# PUT  /book/:id(.:format)   book#update
# DELETE   /book/:id(.:format)   book#destroy