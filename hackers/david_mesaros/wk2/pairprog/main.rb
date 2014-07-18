require 'pry'
require 'sinatra'
require 'sinatra/reloader'


 get '/' do
 	@text = "Do you have a test for that?"
 	@yes = "/pass"
 	@no = "/write_test"
 	erb :yes_or_no
 end

 get '/pass' do
 	@text = "Does the test pass?"
 	@yes = "/refactor"
 	@no = "/write_code"
 	erb :yes_or_no
 end

 get '/write_code' do
 	@text = "Write just enough code for the test to pass."
 	@done = "/pass"
 	erb :done
 end

 get '/write_test' do
 	@text = "Write a test."
 	@done = "/pass"
 	erb :done
 end

 get '/refactor' do
 	@text = "Need to refactor?"
 	@yes = "/do_refactor"
 	@no = "/new_feature"
 	erb :yes_or_no
 end

 get '/do_refactor' do
 	 @text = 'Refactor the code.'
	 @done = '/pass'
	 erb :done
 end

 get '/new_feature' do
 	 @text = 'Select a new feature to implement.'
	 @restart = '/'
	 erb :restart
 end

 get '/back' do
  @restart = '/'
  erb :back
 end