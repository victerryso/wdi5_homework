class UsersController < ApplicationController
  before_action :check_if_logged_in, :except => [:new, :create]
  before_action :check_if_admin, :only => [:index]

  def new
    @user = User.new
  end

  def create
    @user = User.create user_params
    if @user.save
      @date = params[:date] ? Date.parse(params[:date]) : Date.today
      birthday = @user.dob.to_s
      birthday = @date.year.to_s + "-" + birthday[5,9]
      user_birthday = Event.create(:name => 'My Birthday', :date => Date.parse(birthday), :image => 'http://i.imgur.com/7NfALqS.png?1', :user_id => @user.id )
      user_birthday.save
      @user.events << user_birthday
      redirect_to root_path
    else
      render :new
    end
  end

  def index
      @users = User.all
  end

  def edit
    @user = User.find params[:id]
    unless @user.id == @current_user.id
    redirect_to calendar_show_path
    end
  end

  def update
    user = User.find params[:id]
    user.update user_params

    redirect_to user
  end

  def show
    @user = @current_user # User.find params[:id]
    if @user.nil?
      redirect_to root_path
    end
  end

  def destroy
    user = User.find params[:id]
    user.destroy

    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :dob, :image, :password, :password_confirmation)
  end
  def check_if_logged_in
    redirect_to(root_path) if @current_user.nil?
  end

  def check_if_admin
    redirect_to(root_path) unless @current_user.is_admin?
  end

end
