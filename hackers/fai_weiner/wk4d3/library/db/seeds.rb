Author.destroy_all
Book.destroy_all

Author.create(:name => 'Jane Eyre', :birth_place => 'England', :dob => '1847-10-16', :image => 'http://thehairpin.com/wp-content/uploads/2012/07/Picture-17.jpg')
Author.create(:name => 'Ernest Hemingway', :birth_place => 'USA', :dob => '1899-07-21', :image => 'http://upload.wikimedia.org/wikipedia/commons/b/bb/Ernest_Hemingway_1923_passport_photo.jpg')

Book.create(:title => 'The Old Man and the Sea', :pages => 127, :ISBN => '0-684-80122-1', :image => 'http://upload.wikimedia.org/wikipedia/en/7/73/Oldmansea.jpg')