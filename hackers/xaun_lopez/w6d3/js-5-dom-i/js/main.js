// (In JS) Change the body tag's style so it has a font-family of "Arial, sans-serif".
// (In JS) Replace each of the spans (nickname, favorites, hometown) with your own information.
// Iterate through each li and change the class to "listitem". Add a style tag that sets a rule for "listitem" to make the color red.
// Create a new img element and set its src attribute to a picture of you. Append that element to the page.

var body = document.getElementsByTagName('body')[0];
body.style.fontFamily = "Arial, sans-serif";

var nickname = document.getElementById('nickname');
nickname.innerHTML = 'Madcunt x-killa';

var favorites = document.getElementById('favorites');
favorites.innerHTML = "street cred";

var hometown = document.getElementById('hometown');
hometown.innerHTML = 'Sydney';

var listsItems = document.getElementsByTagName('li');
for (var i = 0; i < listsItems.length; i++) {
  var listItem = listsItems[i];
  listItem.className = "listitem";
  listItem.style.color = 'red';
};

var pageNode = document.getElementsByTagName('aside')[0];

var newImg = document.createElement('img')
newImg.src = 'http://i.imgur.com/c8iCpIC.jpg'
pageNode.appendChild(newImg);
