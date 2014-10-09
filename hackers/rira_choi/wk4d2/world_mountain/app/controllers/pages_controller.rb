class PagesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def home
  end

  def index
    @mountains = Mountain.all
  end

  def new
  end

  def create
    Mountain.create params.require(:mountain).permit(:name, :image, :country, :Elevation, :range, :coordinates, :description)
    redirect_to mountains_path
  end

  def show
    @mountain = Mountain.find params[:id]
  end

  def edit
    @mountain = Mountain.find params[:id]
  end

  def update
    mountain = Mountain.find params[:id]
    mountain.update params.require(:mountain).permit(:name, :image, :country, :Elevation, :range, :coordinates, :description)

    mountain.save
    redirect_to mountains_path
  end

  def destroy
    mountain = Mountain.find params[:id]
    mountain.destroy
    redirect_to planets_path
  end

end