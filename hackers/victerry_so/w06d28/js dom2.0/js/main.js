// Create a webpage with an h1 of "My Book List".
// Add a script tag to the bottom of the page, where all your JS will go.
// Copy this array of books:
// var books = [
//   {title: 'The Design of EveryDay Things',
//    author: 'Don Norman',
//    alreadyRead: false
//   },
//   {title: 'The Most Human Human',
//   author: 'Brian Christian',
//   alreadyRead: true
//   }];
// Iterate through the array of books. For each book, create a p element with the book title and author and append it to the page.
// Bonus: Use a ul and li to display the books.
// Bonus: add a property to each book with the URL of the book cover, and add an img element for each book on the page.
// Bonus: Change the style of the book depending on whether you have read it or not.
pageNode = document.getElementsByTagName('body')[0];
var headerOne = document.createElement('h1');
var headerOneText = document.createTextNode('My Book List');
headerOne.appendChild(headerOneText);
pageNode.appendChild(headerOne);

var books = [
  {title: 'The Design of EveryDay Things',
   author: 'Don Norman',
   img: 'http://upload.wikimedia.org/wikipedia/en/3/33/The_Design_of_Everyday_Things_%28cover_1988%29.jpg',
   alreadyRead: false
  },
  {title: 'The Most Human Human',
  author: 'Brian Christian',
  img: 'http://pic.eslite.com/Upload/Product/201207/m/634770076999320000.jpg',
  alreadyRead: true
  }];

var newUList = document.createElement('ul');
for ( i = 0; i < books.length; i++ ) {
  var newParagraph = document.createElement('li');
  var newParagraphText = document.createTextNode(books[i].title + ' by ' + books[i].author);
  if (books[i].alreadyRead) {
    newParagraph.style.color = 'red';
  };
  newParagraph.appendChild(newParagraphText);
  pageNode.appendChild(newParagraph);

  var newImg = document.createElement('img');
  newImg.src = books[i].img;
  pageNode.appendChild(newImg);
};

pageNode.appendChild(newUList);