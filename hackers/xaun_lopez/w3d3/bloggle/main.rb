require 'pry'
require 'pry-debugger'
require 'sinatra'
require 'sinatra/reloader'

require_relative 'bloggle'

before do
end

after do
  ActiveRecord::Base.connection.close
end

get '/' do
  redirect '/bloggle'
end

# All blogs
get '/bloggle' do
  @blogs = Bloggle.all
  erb :blogs
end

# Show form for a new blog.
get '/bloggle/new' do
  erb :new_blog
end

# A specific blog.
get '/bloggle/:id' do
  id = params[:id]
  @blog = Bloggle.find id
  erb :blog
end

# Edit a blog.
get '/bloggle/:id/edit' do
  id = params[:id]
  @blog = Bloggle.find id
  erb :edit_blog
end

# Update a blog.
post '/bloggle/:id' do
  blog = Bloggle.find params[:id]
  blog.title = params[:title]
  blog.image = params[:image]
  blog.description = params[:description]

  blog.save

  redirect to "/bloggle/#{ blog.id }"
end

# Delete a blog.
get '/bloggle/:id/delete' do
  id = params[:id]
  blog = Bloggle.find id

  blog.destroy

  redirect to "/bloggle"
end

# Add a new blog to the database.
post '/bloggle' do
  Bloggle.create :title => params[:title], :description => params[:description], :image => params[:image]
  redirect to '/bloggle'
end
