class UsersController < ApplicationController
  def index
    if @current_user.try(:is_admin)
      @users = User.all
    else
      @users = User.none
    end
  end

  def new
    @user = User.new
  end

  def create
    # raise params.inspect
    @user = User.new user_params
    @user.username.downcase!
    @user.save
    if @user.save
      session[:user_id] = @user.id
      redirect_to( root_path )
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :avatar, :password, :password_confirmation)
  end

end