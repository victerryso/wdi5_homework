# == Schema Information
#
# Table name: mountains
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  image       :text
#  country     :text
#  Elevation   :text
#  range       :text
#  coordinates :text
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Mountain < ActiveRecord::Base
end
