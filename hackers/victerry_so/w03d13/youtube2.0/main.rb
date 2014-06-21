require "pry"
require "pry-debugger"
require "sinatra"
require "sinatra/reloader"
require "sqlite3"
require_relative "video"

get "/" do # list of videos
  @video = Video.all
  erb :index
end

get "/new" do # form for new video
  erb :new
end

post "/" do # add new video
  Video.create(:title => params[:title], :description => params[:description], :url => params[:url])
  redirect to "/"
end

get "/:id" do # view video
  id = params[:id]
  @video = Video.find id
  erb :view
end

get "/:id/edit" do # edit form for video
  id = params[:id]
  @video = Video.find id
  erb :edit
end

post "/:id" do # updated video
  video = Video.find params[:id]
  video.title = params[:title]
  video.description = params[:description]
  video.url = params[:url]
  video.save
  redirect to "/#{video.id}"
end

get "/:id/delete" do # delete video
  id = params[:id]
  video = Video.find id
  video.destroy
  redirect to "/"
end

def query_db(sql)
  db = SQLite3::Database.new "video.db" # getting database from the file
  db.results_as_hash = true # changing array of arrays to array of hashes
  result = db.execute sql # saving the sql command of the database into result
  db.close # closing database
  result #returning the result
end