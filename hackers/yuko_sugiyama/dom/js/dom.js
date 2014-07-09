var page = document.getElementsByTagName('body')[0];
    console.log(page);
    page.style.fontFamily = 'Arial', 'sans-serif';

var span1 = document.getElementById('nickname');
    span1.innerHTML = "sugi";

var span2 = document.getElementById('favorites');
    span2.innerHTML = "icecream";

var span3 = document.getElementById('hometown');
    span3.innerHTML = "Hiratsuka";

var node1 = document.getElementsByTagName("li")[0];
    node1.setAttribute("class", "listitem");
var node2 = document.getElementsByTagName("li")[1];
    node2.setAttribute("class", "listitem");
var node3 = document.getElementsByTagName("li")[2];
    node3.setAttribute("class", "listitem");

var elements = document.getElementsByClassName("listitem");
for(var i=0, l=elements.length; i<l; i++){
 elements[i].style.color = "red";
};

var img = document.getElementById('photo');
var anyImage = img.src;
  console.log(anyImage);
  img.src = 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTMyUyiBfS9Xm5L5p65KTlEdAYaBRN1qWMwmrYfCDAsTOHHJN2A2JKC07Q';
