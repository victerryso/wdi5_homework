// Create a webpage with an h1 of "My Book List".
// Add a script tag to the bottom of the page, where all your JS will go.
// Copy this array of books:
// Iterate through the array of books. For each book, create a p element with the book title and author and append it to the page.
// Bonus: Use a ul and li to display the books.
// Bonus: add a property to each book with the URL of the book cover, and add an img element for each book on the page.
// Bonus: Change the style of the book depending on whether you have read it or not.

var books = [
  {title: 'The Design of EveryDay Things',
   author: 'Don Norman',
   alreadyRead: false,
   img: 'http://3.bp.blogspot.com/-ij_YBKzs7xI/UfLrlo3uE4I/AAAAAAAAAao/s5awjH4ah68/s320/Cover+DOET2+Cover+May+25,+2013.jpg'
  },
  {title: 'The Most Human Human',
  author: 'Brian Christian',
  alreadyRead: true,
  img: 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTEXIXmIDIjt65sOgmU-GICBccBtHz9SOyKAYkbbEiGpdCVWVU2IQ'
  }];

var pageNode = document.getElementsByTagName('body')[0];
var check = function(){

      for( i = 0; i < books.length; i++ ){
        // if ( books[i].alreadyRead === true){
        //     var page = document.getElementsByTagName('body')books[i];
        //        page.style.color = 'green';
        //      }

            var bookParagraph = document.createElement('ul');
            var titleParagraph = document.createElement('li');
                titleParagraph.innerHTML = books[i].title;
                pageNode.appendChild(titleParagraph);

            var authorParagraph = document.createElement('li');
                authorParagraph.innerHTML = books[i].author;
                pageNode.appendChild(authorParagraph);

            var newImg = document.createElement('img');
                newImg.src = books[i].img;
                pageNode.appendChild(newImg);
              pageNode.appendChild(bookParagraph);
        }

};

check();




