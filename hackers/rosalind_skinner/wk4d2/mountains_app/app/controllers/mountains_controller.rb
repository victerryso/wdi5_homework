class MountainsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def home
  end

  def index
    @mountains = Mountain.all
  end

  def new
  end

  def show
    @mountain = Mountain.find params[:id]
  end

  def create
    Mountain.create params.require(:mountain).permit(:name, :location, :elevation, :range, :first, :image)
    redirect_to mountains_path
  end

  def destroy
    mountain = Mountain.find params[:id]
    mountain.destroy
    redirect_to mountains_path
  end

  def edit
    @mountain = Mountain.find params[:id]
  end

  def update
    mountain = Mountain.find params[:id]
    mountain.update params.require(:mountain).permit(:name, :location, :elevation, :range, :first, :image)
    redirect_to mountains_path
  end

end