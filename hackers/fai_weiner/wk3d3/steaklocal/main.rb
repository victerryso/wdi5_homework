require 'pry'
require 'pry-debugger'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

require_relative 'steakhouse'

after do
  ActiveRecord::Base.connection.close
end

get '/' do #landing page - PAGE 1
  erb :index
end

get '/steakhouse' do
  @steakhouses = Steakhouse.all
  erb :view_all
end

get '/steakhouse/new' do #direct to new steakhouse FORM - PAGE 2
  erb :new_steakhouse
end

get '/steakhouse/:id/edit' do #pull FORM to edit
  id = params[:id]
  @steakhouse = Steakhouse.find id
  erb :edit_steakhouse
end

get '/steakhouse/:id' do #view individial steakhouse with ratings and option to edit or delete
  id = params[:id]
  @steakhouse = Steakhouse.find id
  erb :view
end

post '/steakhouse/:id' do #edit existing steakhouse
  id = params[:id]

  steakhouse = Steakhouse.find id
  steakhouse.name = params[:name]
  steakhouse.logo = params[:logo]
  steakhouse.url = params[:url]
  steakhouse.address = params[:address]
  steakhouse.zipcode_id = params[:zipcode_id]
  steakhouse.description = params[:description]
  steakhouse.style = params[:style]
  steakhouse.rating = params[:rating]
  steakhouse.latitude = params[:latitude]
  steakhouse.longtitude = params[:longtitude]

  steakhouse.save

  redirect to "/steakhouse/#{ id }"
end



post '/steakhouse' do #input new data - PAGE 3
  steakhouse = Steakhouse.new
  steakhouse.name = params[:name]
  steakhouse.logo = params[:logo]
  steakhouse.url = params[:url]
  steakhouse.address = params[:address]
  steakhouse.zipcode_id = params[:zipcode_id]
  steakhouse.description = params[:description]
  steakhouse.style = params[:style]
  steakhouse.rating = params[:rating]
  steakhouse.latitude = params[:latitude]
  steakhouse.longtitude = params[:longtitude]

  steakhouse.save

  redirect to "/steakhouse"
end

get '/steakhouse/:id/delete' do
  id = params[:id]
  @steakhouse = Steakhouse.find id
  erb :delete_steakhouse
end

post '/steakhouse/:id/delete' do
  id = params[:id]
  steakhouse = Steakhouse.find id
  steakhouse.destroy
  redirect to "/steakhouse"
end

def query_db(sql)
  db = SQLite3::Database.new "steakhouse.db"
  db.results_as_hash = true
  result = db.execute sql
  db.close
  result
end

