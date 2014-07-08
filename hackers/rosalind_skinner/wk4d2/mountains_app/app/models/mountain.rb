# == Schema Information
#
# Table name: mountains
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  location   :text
#  elevation  :float
#  range      :text
#  first      :integer
#  image      :text
#  created_at :datetime
#  updated_at :datetime
#

class Mountain <ActiveRecord::Base
end
