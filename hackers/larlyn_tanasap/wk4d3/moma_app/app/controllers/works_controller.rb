class WorksController < ApplicationController
  def index
    @works = Work.all # if the error is WorksController::Works I misspelled rge Work.all
  end

  def create
    work = Work.create work_params
    redirect_to( work )
  end

  def new
    @work = Work.new
  end

  def edit
    @work = Work.find params[:id]
  end

  def show
    @work = Work.find params[:id]
  end

  def update
    work = Work.find params[:id]
    work.update work_params
    redirect_to( work )
  end

  def destroy
    work = Work.find params[:id]
    work.destroy
    redirect_to(works_path)
  end

  private
  def work_params
    params.require(:work).permit(:title, :year, :medium, :style, :image, :artist_id)
  end
end

  #     works GET    /works(.:format)            works#index
  #           POST   /works(.:format)            works#create
  #  new_work GET    /works/new(.:format)        works#new
  # edit_work GET    /works/:id/edit(.:format)   works#edit
  #      work GET    /works/:id(.:format)        works#show
  #           PATCH  /works/:id(.:format)        works#update
  #           PUT    /works/:id(.:format)        works#update
  #           DELETE /works/:id(.:format)        works#destroy