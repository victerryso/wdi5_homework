# == Schema Information
#
# Table name: mixtapes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class MixtapeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
