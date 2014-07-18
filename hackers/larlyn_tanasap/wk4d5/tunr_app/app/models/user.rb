# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)
#  email           :string(255)
#  avatar          :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  password_digest :string(255)
#  is_admin        :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  validates :username, :presence => true, :length => { :minimum => 2, :unique => true }
  has_secure_password
  has_many :mixtapes
end
