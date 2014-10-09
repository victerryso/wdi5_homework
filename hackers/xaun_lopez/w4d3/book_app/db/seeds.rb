Author.destroy_all
Book.destroy_all

Author.create(
  :name => 'Andy McNab',
  :nationality => 'English',
  :dob => '1959/12/28',
  :image => 'http://www.thenewsgrind.com/wp-content/uploads/2010/06/andy-mcnab.jpg'
)
Book.create(
  :title => 'Remote Control',
  :pages => '512',
  :ISBN => '0552163538',
  :image => 'http://ecx.images-amazon.com/images/I/51450Js2hZL.jpg',
  :release => '1995/05/13',
  :genre => 'DEATH',
  :description => 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Praesentium tempore aperiam molestiae porro sit totam, explicabo nesciunt, officiis laboriosam est eaque commodi natus ut corrupti ipsam vel veritatis laborum quibusdam.'
)
Book.create(
  :title => "Harry Potter and the Sorcerer's Stone",
  :pages => 320,
  :ISBN => '0439708184',
  :image => 'http://www.watt-evans.com/potter1.jpg',
  :description => "Harry Potter has no idea how famous he is. That's because he's being raised by his miserable aunt and uncle who are terrified Harry will learn that he's really a wizard, just as his parents were. But everything changes when Harry is summoned to attend an infamous school for wizards, and he begins to discover some clues about his illustrious birthright."
)
Book.create(
  :title => "Harry Potter and the Chamber of Secrets",
  :pages => 368,
  :ISBN => '054558292X',
  :image => 'http://upload.wikimedia.org/wikipedia/en/5/5c/Harry_Potter_and_the_Chamber_of_Secrets.jpg',
  :description => "The Dursleys were so mean and hideous that summer that all Harry Potter wanted was to get back to the Hogwarts School for Witchcraft and Wizardry. But just as he’s packing his bags, Harry receives a warning from a strange, impish creature named Dobby who says that if Harry Potter returns to Hogwarts, disaster will strike."
)
Author.create(
  :name => 'J. K. Rowling',
  :nationality => 'English',
  :dob => '1965/07/31',
  :image => 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTbnA1fSEYMy5wSMJq_ipY3sqylDpCVjVaQp07ovhZd77LYLC9r'
)
