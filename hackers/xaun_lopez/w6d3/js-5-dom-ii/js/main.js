// Iterate through the array of books. For each book, create a p element with the book title and author and append it to the page.
// Bonus: Use a ul and li to display the books.
// Bonus: add a property to each book with the URL of the book cover, and add an img element for each book on the page.
// Bonus: Change the style of the book depending on whether you have read it or not.

var books = [
  {title: 'The Design of EveryDay Things',
   author: 'Don Norman',
   alreadyRead: false
  },
  {title: 'The Most Human, Human',
  author: 'Brian Christian',
  alreadyRead: true
  }
];

var body = document.getElementsByTagName('body')[0];
var p = document.createElement('p');
p.innerHTML = ""
body.appendChild(p)
var ul = document.createElement('ul');
p.innerHTML = ""
p.appendChild(ul)


for (i = 0; i < books.length; i++) {
  var li = document.createElement('li');
  li.innerHTML = books[i].title;
  ul.appendChild(li);
  var li = document.createElement('li');
  li.innerHTML = books[i].author;
  ul.appendChild(li);
}
