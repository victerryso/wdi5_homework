Event.destroy_all
User.destroy_all

e1 = Event.create(:name => 'Meeting', :date => "2014-04-22" )


u1 = User.create(:username => 'Rira Choi', :email => 'rira.nunu.choi@gmail.com', :dob => '1987-05-22', :image => 'http://i.imgur.com/9Yka0wL.png?3', :password => 'abcd', :password_confirmation => 'abcd', :is_admin => true )
u2 = User.create(:username => 'Jane Austen', :email => 'janeausten@hello.com', :dob => '1987-04-18', :image => 'http://i.imgur.com/9Yka0wL.png?3', :password => 'abc', :password_confirmation => 'abc')

u1.events << e1
