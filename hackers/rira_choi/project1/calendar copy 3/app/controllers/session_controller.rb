class SessionController < ApplicationController
  def new
  end

  def create
    # raise params.inspect
    # user = User.where(:username => params[:username]).first
    user = User.find_by(:username => params[:username])
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path

    else
      redirect_to login_path
    end
  end

  def destroy
    # raise params.inspect
    session[:user_id] = nil
    redirect_to root_path

  end
end
