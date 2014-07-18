class OceansController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @oceans = Ocean.all
  end

  def new
  end

  def create
    Ocean.create params.require(:ocean).permit(:name, :zone, :image, :depth, :climate)
    redirect_to oceans_path
  end

  def show
    @ocean = Ocean.find params[:id]
  end

  def destroy
    ocean = Ocean.find params[:id]
    ocean.destroy
    redirect_to oceans_path
  end

  def edit
    @ocean = Ocean.find params[:id]
  end

  def update
    ocean = Ocean.find params[:id]
    ocean.update params.require(:ocean).permit(:name, :zone, :image, :depth, :climat)
    redirect_to oceans_path
  end
end	