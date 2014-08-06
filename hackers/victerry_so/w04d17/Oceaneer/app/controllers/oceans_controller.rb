class OceansController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @oceans = Ocean.all
  end

  def new
  end

  def create
    Ocean.create params.require(:ocean).permit(:name, :area, :depth, :location, :image)
    redirect_to index_path
  end

  def edit
    @ocean = Ocean.find params[:id]
  end

  def update
    ocean = Ocean.find params[:id]
    ocean.update params.require(:ocean).permit(:name, :area, :depth, :location, :image)
    redirect_to index_path
  end

  def destroy
    ocean = Ocean.find params[:id]
    ocean.destroy
    redirect_to index_path
  end
end