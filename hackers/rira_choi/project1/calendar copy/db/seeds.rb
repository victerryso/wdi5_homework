Event.destroy_all
User.destroy_all

e1 = Event.create(:name => 'Meeting', :date => "2014-04-22", :image => 'http://i.imgur.com/VgujmI2.png?1', :user_id => 7 )
e2 = Event.create(:name => 'My Birthday', :date => "2014-05-22", :image => 'http://i.imgur.com/7NfALqS.png?1', :user_id => 7 )
e3 = Event.create(:name => 'Joel\'s babyshower', :date => "2014-07-20", :image => 'http://i.imgur.com/QgyWEnt.png?1', :user_id => 7 )
e4 = Event.create(:name => 'David\'s Wedding', :date => "2015-04-12", :image => 'http://i.imgur.com/pEZwa3W.png?1', :user_id => 7 )
e5 = Event.create(:name => 'Going to Melbourne', :date => "2014-07-27", :image => 'http://i.imgur.com/OcIn4ds.png?1', :user_id => 7 )
e6 = Event.create(:name => 'Valentine\'s Day', :date => "2014-02-14", :image => 'http://i.imgur.com/VfuWprd.png?1', :user_id => 7 )
e7 = Event.create(:name => 'Presentation Project1', :date => "2014-07-04", :image => 'http://i.imgur.com/f10BbHs.png?1', :user_id => 7 )
e8 = Event.create(:name => 'GA Workshop', :date => "2014-07-13", :image => 'http://i.imgur.com/VgujmI2.png?1', :user_id => 7 )
e9 = Event.create(:name => 'Ruby Conference', :date => "2014-07-19", :image => 'http://i.imgur.com/5PrjrVs.png?1', :user_id => 7 )
e10 = Event.create(:name => 'Movie Day', :date => "2014-07-14", :image => 'http://i.imgur.com/tAT8AUw.png?1', :user_id => 7 )
e11 = Event.create(:name => 'WDI5 Party', :date => "2014-07-04", :image => 'http://i.imgur.com/BIrp93l.png?1', :user_id => 7 )
e12 = Event.create(:name => 'Larlyn\'s B-day', :date => "2014-12-27", :image => 'http://i.imgur.com/7NfALqS.png?1', :user_id => 7 )



u1 = User.create(:username => 'Rira Choi', :email => 'rira.nunu.choi@gmail.com', :dob => '1987-05-22', :image => 'http://i.imgur.com/9Yka0wL.png?3', :password => 'abcd', :password_confirmation => 'abcd', :is_admin => true )
u2 = User.create(:username => 'Jane Austen', :email => 'janeausten@hello.com', :dob => '1987-04-18', :image => 'http://i.imgur.com/9Yka0wL.png?3', :password => 'abc', :password_confirmation => 'abc')

u1.events << e1
