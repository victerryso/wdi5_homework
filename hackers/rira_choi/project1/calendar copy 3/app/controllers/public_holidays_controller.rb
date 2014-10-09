class PublicHolidaysController < ApplicationController
  def index
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    country = Enrico::Country.new("aus")
    @public_holidays = country.public_holidays_for_year(@date)
  end

  def show
  end

end