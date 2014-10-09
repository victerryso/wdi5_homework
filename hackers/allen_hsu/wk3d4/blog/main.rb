require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'active_record'
require_relative 'post'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'blog.db'
)

after do
  ActiveRecord::Base.connection.close
end

get '/blog' do
  @old_posts = Post.all.order(:posted => :desc)
  binding.pry
  erb :index
end

post '/blog/new-post' do
  content = params["new_post"]
  heading = params["heading"]
  Post.create(:content => content, :posted => Time.new.strftime("%Y-%m-%d %H:%M:%S"), :heading => heading)
  redirect '/'
end

get '/blog/:id/view' do
  @old_posts = [Post.find(params["id"])]
  erb :index
end

get '/blog/:id/' do
  @post = Post.find(params["id"])
  erb :edit
end

get '/blog/:id/delete' do
  Post.find(params["id"]).destroy
  redirect '/blog'
end

  post '/blog/:id' do
  post = Post.find(params["id"])
  post.attributes = {content: params["new_post"], heading: params["heading"]}
  post.save
  redirect '/blog'
end


