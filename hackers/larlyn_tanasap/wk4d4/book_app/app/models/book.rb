# == Schema Information
#
# Table name: books
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  release     :date
#  genre       :string(255)
#  author_id   :integer
#  pages       :integer
#  ISBN        :integer
#  image       :text
#  created_at  :datetime
#  updated_at  :datetime
#  description :text
#

class Book < ActiveRecord::Base
  belongs_to :author
end
