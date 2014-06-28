# Build a CRUB site to store Youtube URLs
# Bonus marks: Find the code to embed the videos in the page and play directly from localhost:4567/videos/761 or whatever
# Get your head around all this CRUD stuff and ask DT if you need any help
# Make butterflies look nicer

require "pry"
require "pry-debugger"
require "sinatra"
require "sinatra/reloader"
require "sqlite3"

get "/" do # list of videos
  sql = "SELECT * FROM videos"
  @video = query_db sql
  erb :index
end

get "/new" do # form for new video
  erb :new
end

post "/" do # add new video
  title = params[:title]
  description = params[:description]
  url = params[:url]
  sql = "INSERT INTO videos (title, description, url) VALUES ('#{title}', '#{description}', '#{url}')"
  query_db sql
  redirect to "/"
end

get "/:id" do # view video
  id = params[:id]
  sql = "SELECT * FROM videos WHERE id = #{id}"
  @video = query_db sql
  @video = @video.first
  erb :view
end

get "/:id/edit" do # edit form for video
  id = params[:id]
  sql = "SELECT * FROM videos WHERE id = #{id}"
  @video = query_db sql
  @video = @video.first
  erb :edit
end

post "/:id" do # updated video
  id = params[:id]
  title = params[:title]
  description = params[:description]
  url = params[:url]
  sql = "UPDATE videos SET title = '#{title}', description = '#{description}', url = '#{url}',"
  query_db sql
  redirect to "/:id"
end

get "/:id/delete" do # delete video
  id = params[:id]
  sql = "DELETE FROM videos WHERE id = #{id}"
  query_db sql
  redirect to "/"
end

def query_db(sql)
  db = SQLite3::Database.new "video.db" # getting database from the file
  db.results_as_hash = true # changing array of arrays to array of hashes
  result = db.execute sql # saving the sql command of the database into result
  db.close # closing database
  result #returning the result
end