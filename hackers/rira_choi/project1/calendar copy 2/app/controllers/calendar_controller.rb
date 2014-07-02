class CalendarController < ApplicationController
  def home
  country = Enrico::Country.new("aus","New South Wales")
  # moon_phase = Astro::Moon.new()

  # raise.params.inspect
  country.public_holidays_for_month(Date.today)
  # moon_phase.phasehunt(Date.today)
  end

  def show
     @date = params[:date] ? Date.parse(params[:date]) : Date.today
     country = Enrico::Country.new("aus","New South Wales")
     #Change date.today belwo to date selected
     @pub_holidays = country.public_holidays_for_month(@date)
     #raise.params.inspect
     @events_by_date = Event.find(&:date)
  end

end