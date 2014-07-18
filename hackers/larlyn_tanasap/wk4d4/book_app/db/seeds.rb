# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Author.destroy_all
Book.destroy_all

a1 = Author.create(:name => 'Micho Kaku', :dob => '1947-01-27', :period => 'Modern', :nationality => 'Japanese', :image => 'http://upload.wikimedia.org/wikipedia/commons/f/fe/Michio_Kaku_in_2012.jpg')
b1 = Book.create(:title => 'Parallel Worlds', :release => '2004-12-28', :genre => 'Popular Science', :pages => '428', :ISBN => '978-0385509862', :image => 'http://upload.wikimedia.org/wikipedia/en/9/97/Parallel_Worlds_Kaku_2004.jpg', :description => "In this thrilling journey into the mysteries of our cosmos, bestselling author Michio Kaku takes us on a dizzying ride to explore black holes and time machines, multidimensional space and, most tantalizing of all, the possibility that parallel universes may lie alongside our own. Kaku skillfully guides us through the latest innovations in string theory and its most recent iteration, M-theory, which posits that our universe may be just one in an endless multiverse, a singular bubble floating in a sea of infinite bubble universes. If M-theory is proven correct, we may perhaps finally find an answer to the question, \"What happened before the big bang?\" This is an exciting and unforgettable introduction to the cutting-edge theories of physics and cosmology from one of the preeminent voices in the field.")

a1.books << b1
# b1.author = a1

a2 = Author.create(:name => 'J. K. Rowling', :nationality => 'English', :dob => '1965/07/31', :image =>'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTbnA1fSEYMy5wSMJq_ipY3sqylDpCVjVaQp07ovhZd77LYLC9r')
b3 = Book.create(:title => "Harry Potter and the Sorcerer's Stone", :release => '1997-6-26', :genre => 'Fantasy', :pages => 320, :ISBN =>'0439708184' , :image => 'http://www.watt-evans.com/potter1.jpg', :description =>"Harry Potter has no idea how famous he is. That's because he's being raised by his miserable aunt and uncle who are terrified Harry will learn that he's really a wizard, just as his parents were. But everything changes when Harry is summoned to attend an infamous school for wizards, and he begins to discover some clues about his illustrious birthright.")
# b4 = Book.create(:title => "Harry Potter and the Chamber of Secrets", :release => '1998-7-2', :genre => 'Fantasy', :pages => 368, :ISBN =>'054558292X', :image => 'http://upload.wikimedia.org/wikipedia/en/5/5c/Harry_Potter_and_the_Chamber_of_Secrets.jpg', :description =>"The Dursleys were so mean and hideous that summer that all Harry Potter wanted was to get back to the Hogwarts School for Witchcraft and Wizardry. But just as he's packing his bags, Harry receives a warning from a strange, impish creature named Dobby who says that if Harry Potter returns to Hogwarts, disaster will strike.")

a2.books << b3