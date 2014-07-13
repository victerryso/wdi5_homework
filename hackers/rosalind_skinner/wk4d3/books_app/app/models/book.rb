# == Schema Information
#
# Table name: books
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  pages       :integer
#  isbn        :string(255)
#  image       :text
#  author_id   :integer
#  description :text
#

class Book < ActiveRecord::Base
  belongs_to :author
end
