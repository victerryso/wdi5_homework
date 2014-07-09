var mta = {
    N: ['Times Square', '34th_n', '28th_n', '23rd_n', 'Union Square', '8th_n'],
    L: ['8th_l', '6th_l','Union Square', '3rd_l', '1st_l'],
    "6": ['Grand Central', '3rd_6', '28th_6', '23rd_6','Union Square', 'Astor Place']
    };

  var d_line = prompt("(n)line, (l)line, (6)line, (q) for exit. Please chose line to get on: ");
  var dep_line = d_line.toUpperCase();
  var dep_stop = prompt("Please chose the station to get on:" + mta[dep_line]);

  var index_dep = mta[dep_line].indexOf(dep_stop); // get index number of the station
  //var r_index_dep = mta[dep_line].reverse().indexOf(dep_stop);

  var a_line = prompt("(n)line, (l)line, (6)line, (q) for exit. Please chose line to get on: ");
  var arr_line = a_line.toUpperCase();
  var arr_stop = prompt("Please chose the station to get off:"+ mta[arr_line]);
  var index_arr = mta[arr_line].indexOf(arr_stop);

  //manually find the index of intersection (Union Square)
  var intersection_arr = mta[arr_line].indexOf("Union Square");
  var intersection_dep = mta[dep_line].indexOf("Union Square");

 if (dep_line == arr_line){
        if (index_arr - index_dep > 0){
              var total_stops = Math.abs((index_arr+1) - index_dep);
              var stops = mta[dep_line].slice(index_dep, index_arr+1);
              alert("Total number of stops: " + total_stops + ".  The stations are: " + stops);
            }
        else //if (index_arr - index_dep < 0)
        {
              var reverseDepline = mta[dep_line].reverse();
              var r_index_dep = reverseDepline.indexOf(dep_stop);
              var r_index_arr = reverseDepline.indexOf(arr_stop);
              var r_total_stops = Math.abs((r_index_arr+1)-r_index_dep);
              var r_stops = reverseDepline.slice(r_index_dep, r_index_arr+1);
              alert("Total number of stops: " + r_total_stops + ".  The stop stations are: " + r_stops);
        }
      }
  // dep_line != arr_line
  else{
          //alert("here comes the different line!");
          var total_stops_dep = Math.abs( index_dep - intersection_dep );
          var total_stops_arr = Math.abs( index_arr - intersection_arr );
          var total_stops =  total_stops_dep + total_stops_arr +1;

              //dep_line order way
          if ( (intersection_dep - index_dep) > 0 ){
               user_stops_dep = mta[dep_line].slice(index_dep, intersection_dep);

                  //arr_line order way
                if ( (index_arr - intersection_arr) > 0 ){
                   user_stops_arr = mta[arr_line].slice(intersection_arr, index_arr+1);
                  var user_stops = user_stops_dep + user_stops_arr;
                  alert("Total number of stops: " + total_stops + ". The stop stations are: " + user_stops);
                }
                else {
                        var reverseArrline = mta[arr_line].reverse();
                        var reverseArrindex = reverseArrline.indexOf(arr_stop);
                        var reverseArrintersection = reverseArrline.indexOf("Union Square");
                        reverseArrUserstops = reverseArrline.slice(reverseArrintersection, reverseArrindex+1);
                        var userTotalstops = user_stops_dep + reverseArrUserstops;
                        alert("Total number of stops: " + total_stops + ". The stop stations are: " + userTotalstops);
                      }
           }
           //dep_line is reverse order
          else{
                var reverseDepline = mta[dep_line].reverse();
                var reverseDepindex = reverseDepline.indexOf(dep_stop);
                var reverseDepintersection = reverseDepline.indexOf("Union Square");
                reversDepUserstops = reverseDepline.slice(reverseDepindex, reverseDepintersection);
                  //arr_line is order way
                  if ( (index_arr - intersection_arr) > 0 ){
                      user_stops_arr = mta[arr_line].slice(intersection_arr, index_arr+1);
                      var user_stops = reversDepUserstops + user_stops_arr;
                      alert("Total number of stops: " + total_stops + ". The stop stations are: " + user_stops);
                  }
                  //arr_line is reverse order
                  else
                  {
                    var reverseArrline = mta[arr_line].reverse();
                    var reverseArrindex = reverseArrline.indexOf(arr_stop);
                    var reverseArrintersection = reverseArrline.indexOf("Union Square");
                    reverseArrUserstops = reverseArrline.slice(reverseArrintersection, reverseArrindex+1);
                    var userTotalstops = reversDepUserstops + reverseArrUserstops;
                    alert("Total number of stops: " + total_stops + ". The stop stations are: " + userTotalstops);
                  }
              }


           };
