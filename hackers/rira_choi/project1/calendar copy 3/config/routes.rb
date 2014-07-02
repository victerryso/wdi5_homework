Rails.application.routes.draw do
  root :to => 'calendar#home'

  get '/calendar/show' => 'calendar#show'
  get '/calendar/index' => 'calendar#index'

  resources :events
  resources :users

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
#     public_holidays GET    /public_holidays(.:format)          public_holidays#index
#                     POST   /public_holidays(.:format)          public_holidays#create
#  new_public_holiday GET    /public_holidays/new(.:format)      public_holidays#new
# edit_public_holiday GET    /public_holidays/:id/edit(.:format) public_holidays#edit
#      public_holiday GET    /public_holidays/:id(.:format)      public_holidays#show
#                     PATCH  /public_holidays/:id(.:format)      public_holidays#update
#                     PUT    /public_holidays/:id(.:format)      public_holidays#update
#                     DELETE /public_holidays/:id(.:format)      public_holidays#destroy
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