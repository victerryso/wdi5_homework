# == Schema Information
#
# Table name: authors
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  dob         :date
#  period      :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  nationality :string(255)
#  image       :text
#

class Author < ActiveRecord::Base
  has_many :books
end
