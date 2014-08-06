User.destroy_all
Priority.destroy_all

u1 = User.create :name => 'Apple', :email => 'apple@man.com', :password => 'a', :password_confirmation => 'a'
u2 = User.create :name => 'Banana', :email => 'banana@man.com', :password => 'b', :password_confirmation => 'b'
u3 = User.create :name => 'Cabbage', :email => 'cabbage@man.com', :password => 'c', :password_confirmation => 'c'
u4 = User.create :name => 'Doggy', :email => 'doggy@man.com', :password => 'd', :password_confirmation => 'd'

p1 = Priority.create :name => 'Urgent', :color => '#ff0000', :urgency => 10
p2 = Priority.create :name => 'Somewhat Urgent', :color => '#ff00aa', :urgency => 8
p3 = Priority.create :name => 'Unimportant', :color => '#00ff00', :urgency => 2

u1.priorities << p1 << p2 << p3