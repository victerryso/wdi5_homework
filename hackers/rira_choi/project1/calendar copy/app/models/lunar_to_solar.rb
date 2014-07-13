# == Schema Information
#
# Table name: lunar_to_solars
#
#  id         :integer          not null, primary key
#  lunar_date :string(255)
#  solar_date :string(255)
#  yun        :integer
#  created_at :datetime
#  updated_at :datetime
#
class LunarToSolar < ActiveRecord::Base
  def lunar_to_date
    Date.new(lunar_date[0,4].to_i, lunar_date[4,2].to_i, lunar_date[6,2].to_i)
  end

   def solar_to_date
    Date.new(solar_date[0,4].to_i, solar_date[4,2].to_i, solar_date[6,2].to_i)
  end

  # def current_date
  #   d_current= params[:date] ? Date.parse(params[:date]) : Date.today
  # end
end

