var lines = {
       nLine: ['Times Square', '34th', '28th', '23rd', 'Union Square', '8th'],
       lLine: ['8th','6th','Union Square','3rd','1st'],
       SixLine: ['Grand Central','33rd','28th','23rd','Union Square','Astor Place']
      }
// var startLine = prompt("The Line You Will Get On?");
// var startStop = prompt("The Stop You Will Get On?");
// var endLine = prompt("The Line You Will Get off?");
// var endStop = prompt("The Stop You Will Get off?");

var startLine = 'nLine';
var startStop = '34th';
var endLine = "SixLine";
var endStop = 'Grand Central';

var tracker = function(startLine, startStop, endLine, endStop){
    if (startLine == endLine){
      var startIndex = lines[startLine].indexOf(startStop);
      var endIndex = lines[endLine].indexOf(endStop);
      var singleTotal = endIndex - startIndex;
      console.log("There are total " + singleTotal + " stops! ");
    } else {
      var startIndex = lines[startLine].indexOf(startStop);
      var endIndex = lines[endLine].indexOf(endStop);
      var startIntersectIndex = lines[startLine].indexOf("Union Square");
      var endIntersectIndex = lines[endLine].indexOf("Union Square");
      var totalStops = Math.abs(startIntersectIndex - startIndex) + Math.abs(endIntersectIndex - endIndex);
      console.log("There are total " + totalStops + " stops! ");
    }
  };

tracker(startLine, startStop, endLine, endStop);

//alert("There are total " + tracker(startLine, startStop, endLine, endStop) + " stops! ");
