# == Schema Information
#
# Table name: oceans
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  image           :text
#  size            :integer
#  continents      :text
#  year_discovered :integer
#  nickname        :string(255)
#  percentage      :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class Ocean < ActiveRecord::Base
  
end
