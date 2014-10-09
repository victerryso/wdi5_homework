# == Schema Information
#
# Table name: authors
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  nationality :string(255)
#  dob         :date
#  image       :text
#

class Author < ActiveRecord::Base
  has_many :books
end
