# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)
#  email           :string(255)
#  dob             :date
#  image           :text
#  password_digest :string(255)
#  is_admin        :boolean          default(FALSE)
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  has_secure_password
  has_many :events
  validates :username, :presence => true, :length => { :minimum => 2 }
end
