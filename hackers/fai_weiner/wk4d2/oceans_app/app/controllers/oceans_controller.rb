class OceansController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @oceans = Ocean.all
  end

  def new
  end
  
  def show
    @ocean = Ocean.find params[:id]
  end

  def create
    ocean = Ocean.create params.require(:ocean).permit(:name, :image, :size, :continents, :year_discovered, :nickname, :percentage)
    redirect_to oceans_path
  end

  def edit
    @ocean = Ocean.find params[:id]
  end

  def update
    @ocean = Ocean.find params[:id]
    @ocean.update params.require(:ocean).permit(:name, :image, :size, :continents, :year_discovered, :nickname, :percentage)
    redirect_to oceans_path
  end

  def destroy
    @ocean = Ocean.find params[:id]
    @ocean.destroy
    redirect_to oceans_path
  end
end