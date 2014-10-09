require 'pry'
require 'sinatra'
require 'sinatra/reloader'
require "active_record"
require_relative 'video'
require_relative 'category'

ActiveRecord::Base.logger = Logger.new(File.open('database.log','w'))

ActiveRecord::Base.establish_connection(
  :adapter =>'sqlite3',
  :database => 'youtube.db'
  )

after do
  ActiveRecord::Base.connection.close
end

get '/' do
  erb :intro
end

# All videos
get '/videos' do
  @videos = Video.all
  erb :videos
end

# display/ to show each category's videos/ only 4 of them
get '/videos/category' do
  @categories = Category.all
  erb :group_list
end

# All videos in category
get '/videos/category/:category_id' do
  @videos = Video.where(:category_id => params[:category_id])
  erb :group
end


# Form for a new video
get '/videos/new' do
  erb :new_video
end

#Add a new video
post '/videos' do
  Video.create(:category_id => params["category_id"], :genre => params["genre"], :title => params["title"], :url => params["url"], :description => params["description"])
  redirect to '/videos'

end

# A specific video
get'/videos/:id' do
  id = params[:id]
  @video = Video.find id
  erb :video
  end


# Edit a video (in a single video display)
get '/videos/:id/edit' do
  id = params[:id]
  @video = Video.find id
  erb :edit_video
  end

# Update a video (in a single video display)
post '/videos/:id' do
  video = Video.find params[:id]
  @video.category_id = params[:category_id]
  @video.genre = params[:genre]
  @video.title = params[:title]
  @video.url = params[:url]
  @video.description = params[:description]

  video.save

  redirect to "/videos/#{ id }"
end

# delete a video (in a single video display)
get '/videos/:id/delete' do
  id = params[:id]
  video = Video.find id

  video.delete

  redirect to "/videos"
end


