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

require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
