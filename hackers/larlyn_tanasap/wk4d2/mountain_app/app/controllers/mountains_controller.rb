class MountainsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def index
    @mountains = Mountain.all
  end

  def new
  end

  def create
    Mountain.create params.require(:mountain).permit(:name, :image, :height, :first_climb, :country)
    redirect_to(root_path)
  end

  def show
    @mountain = Mountain.find params[:id]
  end

  def edit
    @mountain = Mountain.find params[:id]
  end

  def update
    mountain = Mountain.find params[:id]
                        # go and get the required key and add these atribs to white list
    mountain.update params.require(:mountain).permit(:name, :image, :height, :first_climb, :country)
    redirect_to(mountain_path)
  end

  def destroy
    mountain = Mountain.find params[:id]
    mountain.destroy
    redirect_to(root_path)
  end
end