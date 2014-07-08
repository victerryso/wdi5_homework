Rails.application.routes.draw do
  root :to => 'mountains#index'
  get '/new' => 'mountains#new'
  post '/' => 'mountains#create'
  get '/:id' => 'mountains#show', :as => 'mountain'
  get '/:id/edit' => 'mountains#edit', :as => 'mountain_edit'
  post '/:id' => 'mountains#update'
  post '/:id/delete' => 'mountains#destroy', :as => 'mountain_delete'
end
