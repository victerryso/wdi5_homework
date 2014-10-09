# == Schema Information
#
# Table name: songs
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  price      :decimal(, )
#  album_id   :integer
#  artist_id  :integer
#  file       :string(255)
#  artwork    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :album
  has_and_belongs_to_many :genres
  has_and_belongs_to_many :mixtapes
end
