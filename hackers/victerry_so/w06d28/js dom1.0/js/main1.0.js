var pageNode = document.getElementsByTagName('body')[0];
pageNode.style.fontFamily = 'arial, san-serifs';

var spanNode = document.getElementsByTagName('li');
spanNode[0].innerHTML = 'First Name'
spanNode[1].innerHTML = 'Middle Name'
spanNode[2].innerHTML = 'Last Name'
for ( i = 0; i < spanNode.length; i ++ ) {
  spanNode[i].className = 'listitem'
}

var listItem = document.getElementsByClassName('listitem');
for ( i = 0; i < listItem.length; i ++ ) {
  listItem[i].style.color = 'red';
}

var newImg = document.createElement('img');
newImg.src = 'http://placekitten.com/500/500'
pageNode.appendChild(newImg);