require 'sinatra'
require 'sinatra/reloader'
require_relative 'clothes.rb'

before do
    # @genres = Video.select('genre').uniq
end

after do # rails will automatically close the db for us
  ActiveRecord::Base.connection.close
end

get '/' do
  @items = Item.all
  erb :index
end

get '/add' do
  erb :add_item
end

post '/' do

  redirect('/')
end

get '/clothes/:id' do
  erb :single_item
end

get '/clothes/:id/edit' do
  erb :edit_item
end

post '/clothes/:id' do

  redirect("/clothes/#{ params[:id]}")
end

get '/clothes/filter/' do ## ?type=shoes&brand=vivienne # filter by type, brand, size, fit, maybe need a splat

end

post '/clothes/:id/delete' do

  redirect("/")
end
