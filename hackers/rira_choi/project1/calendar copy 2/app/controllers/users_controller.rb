class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create user_params
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    if @current_user.try(:is_admin)
      @users = User.all
    else
      @users = User.none
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :dob, :image, :password, :password_confirmation)
  end
end
