class PlanetsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @planets = Planet.all
  end

  def new
  end

  def create
    # planet = Planet.new
    # planet.name = params[:planet][:name]
    # planet.image = params[:planet][:image]
    # planet.orbit = params[:planet][:orbit]
    # planet.mass = params[:planet][:mass]
    # planet.diameter = params[:planet][:diameter]
    # planet.moons = params[:planet][:moons]
    # planet.save
    # Planet.create params[:planet] #we can use this because we made hashes from the form, however this is a security risk
    Planet.create params.require(:planet).permit(:name, :image, :orbit, :diameter, :mass, :moons) ## STRONG ATTRIBUTES
    redirect_to(planets_path) # need a redirect or else this page looks for views/planets/create.html.erb
  end

  def show
    @planet = Planet.find params[:id]
  end

  def destroy
    planet = Planet.find params[:id]
    planet.destroy
    redirect_to(planets_path)
  end

  def edit
    @planet = Planet.find params[:id]
  end

  def update
    planet = Planet.find params[:id]
                        # go and get the required key and add these atribs to white list
    planet.update params.require(:planet).permit(:name, :image, :orbit, :diameter, :mass, :moons)
    redirect_to(planet_path)
  end

end