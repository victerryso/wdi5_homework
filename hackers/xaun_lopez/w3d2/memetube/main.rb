# SO TO REITERATE: Lab for today / homework for tonight

# Build a CRUB site to store Youtube URLs
# Bonus marks: Find the code to embed the videos in the page and play directly from localhost:4567/videos/761 or whatever
# Get your head around all this CRUD stuff and ask DT if you need any help
# Make butterflies look nicer

require 'pry'
require 'pry-debugger'
require 'sinatra'
require 'sinatra/reloader'
require 'SQLite3'

get '/' do
  redirect '/memetube'
end

# All videos
get '/memetube' do
  @videos = query_db("SELECT * FROM videos")

  erb :videos
end

# Show form for a new video.
get '/memetube/new' do

  erb :new_video
end

# A specific video.
get '/memetube/:id' do
  id = params[:id]
  sql = "SELECT * FROM videos WHERE id = #{ id }"
  @video = query_db sql
  @video = @video.first


  erb :video
end

# Edit a video.
get '/memetube/:id/edit' do
  id = params[:id]
  sql = "SELECT * FROM videos WHERE id = #{ id }"
  @video = query_db sql
  @video = @video.first

  erb :edit_video
end

# Update a video.
post '/memetube/:id' do
  id = params[:id]
  title = params[:title]
  description = params[:description]
  url = params[:url]
  rating = params[:rating]

  sql = "UPDATE videos SET title='#{ title }', description='#{ description }', url='#{ url }', rating='#{ rating }' WHERE id=#{ id }"
  query_db sql

  redirect to "/memetube/#{ id }"
end

# Delete a video.
get '/memetube/:id/delete' do
  id = params[:id]
  sql = "DELETE FROM videos WHERE id=#{ id }"
  query_db sql

  redirect to "/memetube"
end

# Add a new video to the database.
post '/memetube' do
  title = params[:title]
  description = params[:description]
  url = params[:url]
  rating = params[:rating]
  sql = "INSERT INTO videos (title, description, url, rating) VALUES ('#{ title }', '#{ description }', '#{ url }', '#{ rating }')"
  query_db sql
  redirect to '/memetube'
end

def query_db(sql)
  db = SQLite3::Database.new "videos.db"
  db.results_as_hash = true
  result = db.execute sql
  db.close
  result
end
