# == Schema Information
#
# Table name: mountains
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  image       :text
#  height      :float
#  first_climb :integer
#  country     :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Mountain < ActiveRecord::Base
end
