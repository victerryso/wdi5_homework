class PublicHolidaysController < ApplicationController
  def index
    @public_holidays = PublicHolidays.all
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end
end