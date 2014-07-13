require 'pry'
require 'sinatra'
require 'sinatra/reloader'


get '/' do 

	@choice = params[:choice] 

	if  @choice == "yes"
		redirect '/pass'
	elsif @choice == "no"
		redirect '/write_test'
	end

erb :start
end

get '/pass' do  #yes 
@choice = params[:choice] 
    if  @choice == "yes"
		redirect '/refactor'
	elsif @choice == "no"
		redirect '/write_code'
	end
 
erb :pass
end

get '/refactor' do 
	@choice = params[:choice]
	if  @choice == "yes"
		redirect '/do_refactor'
	elsif @choice =="no"
		redirect '/new_feature'
	end
erb :refactor

end

get '/do_refactor' do 
	@choice = params[:choice]
	if @choice == "done"
		redirect '/pass'
	end	
	erb :do_refactor
end

get '/write_test' do 
	@choice = params[:choice]
	if  @choice == "done"
		redirect '/pass'
	end
erb :write_test
end

get '/write_code' do 
	@choice = params[:choice]
	if  @choice == "done"
		redirect '/pass'
	end
erb :write_code
end

get '/new_feature' do 
	@choice = params[:choice]
	if  @choice == "continue"
		redirect '/'
	end
erb :new_feature
end





