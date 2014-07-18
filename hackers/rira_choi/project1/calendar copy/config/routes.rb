Rails.application.routes.draw do
  root :to => 'calendar#home'
  get '/calendar/year' => 'calendar#year'
  get '/calendar/show' => 'calendar#show'
  get '/calendar/index' => 'calendar#index'

  get '/events/lists' => 'events#lists'
  # events_lists_path
  get '/events/kinds' => 'events#kinds'
  get '/events/kind/:kind' =>'events#kind'
  resources :events
  resources :users, :except => 'show'
  get '/users/show' => 'users#show', :as => :user_show

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
#             Prefix Verb   URI Pattern                         Controller#Action
#                root GET    /                                   calendars#home
#      calendars_show GET    /calendars/show(.:format)           calendars#show
#              events GET    /events(.:format)                   events#index
#                     POST   /events(.:format)                   events#create
#           new_event GET    /events/new(.:format)               events#new
#          edit_event GET    /events/:id/edit(.:format)          events#edit
#               event GET    /events/:id(.:format)               events#show
#                     PATCH  /events/:id(.:format)               events#update
#                     PUT    /events/:id(.:format)               events#update
#                     DELETE /events/:id(.:format)               events#destroy
#               users GET    /users(.:format)                    users#index
#                     POST   /users(.:format)                    users#create
#            new_user GET    /users/new(.:format)                users#new
#           edit_user GET    /users/:id/edit(.:format)           users#edit
#                user GET    /users/:id(.:format)                users#show
#                     PATCH  /users/:id(.:format)                users#update
#                     PUT    /users/:id(.:format)                users#update
#                     DELETE /users/:id(.:format)                users#destroy
#               login GET    /login(.:format)                    session#new
#                     POST   /login(.:format)                    session#create
#                     DELETE /login(.:format)                    session#destroy