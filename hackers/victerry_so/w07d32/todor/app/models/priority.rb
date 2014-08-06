# == Schema Information
#
# Table name: priorities
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  color      :string(255)      default("#fff")
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Priority < ActiveRecord::Base
  belongs_to :user
  has_many :tasks
end
