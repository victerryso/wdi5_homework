class CalendarController < ApplicationController
  def home
  country = Enrico::Country.new("aus","New South Wales")
  # moon_phase = Astro::Moon.new()
  # raise.params.inspect
  country.public_holidays_for_month(Date.today)
  # moon_phase.phasehunt(Date.today)
  end

  def show
     @date = date_params
     country = Enrico::Country.new("aus","New South Wales")
     @public_holidays = country.public_holidays_for_month(@date)
  end

  def index
  end


  def date_params
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end
end