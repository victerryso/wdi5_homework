# == Schema Information
#
# Table name: public_holidays
#
#  id          :integer          not null, primary key
#  date        :string(255)
#  localname   :string(255)
#  englishname :string(255)
#  image       :text
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class PublicHoliday < ActiveRecord::Base
end
