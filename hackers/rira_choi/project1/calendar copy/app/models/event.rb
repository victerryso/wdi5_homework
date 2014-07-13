# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  date       :date
#  image      :text
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Event < ActiveRecord::Base
  belongs_to :user

  def self.icon_option
   { "Special Day" => [
       ['Anniversary', 'http://i.imgur.com/VfuWprd.png?1'],
       ['Birthday', 'http://i.imgur.com/7NfALqS.png?1'],
       ['Wedding', 'http://i.imgur.com/pEZwa3W.png?1'],
       ['Babyshower', 'http://i.imgur.com/QgyWEnt.png?1'],
       ['Dinner', 'http://i.imgur.com/g2Pa7a9.png?1'],
       ['Party', 'http://i.imgur.com/BIrp93l.png?1'],
       ['Travel', 'http://i.imgur.com/OcIn4ds.png?1'],
       ['Others', 'http://i.imgur.com/tAT8AUw.png?1']
     ],
   "Business" => [
       ['Meeting', 'http://i.imgur.com/VgujmI2.png?1'],
       ['Workshop', 'http://i.imgur.com/q4shvdS.png?1'],
       ['Presentation', 'http://i.imgur.com/f10BbHs.png?1'],
       ['Conference', 'http://i.imgur.com/5PrjrVs.png?1'],
       ['Others', 'http://i.imgur.com/tAT8AUw.png?1']
     ]
   }
  end
end
