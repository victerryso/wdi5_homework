var lines = {
  N: ['N_Times_Square','N_34th','N_28th','N_23rd','Union_Square','N8th'],
  L: ['L8th','L_6th','Union_Square','L_3rd','L_1st'],
  L6: ['Grand_Central','L6_33rd','L6_28th','L6_23rd','Union_Square','L6_Astor_Place'],
  Seven: ['Seven_Queensboro_Plaza', 'Seven_Court_Sq', 'Seven_Hunters_Point_Avenue', 'Seven_Vernon_Boulevard','Grand_Central']
};

var stopList0th = function (startIndex, stopIndex, lineAndStation, lineHash) {
  var stops = [];
  var numberOfStops = (startIndex-stopIndex);
  // (begin).step(end,stepsize)
  var sign = startIndex < stopIndex ? 1 : -1;
  try {
    for (var i = startIndex; i < stopIndex; i += sign) {
      stops.push(hash[line_and_station.line][i]);
    }
  }catch () {
    stops = [];
  }
  return stops;
};

var stops_list_1st = function (hash, startStation, endStation) {
  var stops =[];
  var common = findCommon(hash,startStation,endStation);
  var startIndex = hash[startStation.line].indexOf(startStation.station);
  var startCommonIndex = hash[startStation.line].indexOf(common[-1]);
  var endIndex = hash[endStation.line].indexOf(endStation.station);
  var endCommonIndex = hash[endStation.line].indexOf(common[-1]);
  // #check for station on the same line - replaces comparing :line attribute
  // if (hash.select{|key, stations|stations.include?(start_station[:station])&&stations.include?(end_station[:station])})
  if (hash.startStation.line.indexOf(endStation) !== -1) {
    var endIndex = hash[startStation.line]].indexOf(endStation.station);
    return [stopList0th(startIndex,endIndex,startStation,hash)];
  }
  else
    var startToCommon = stopList0th(startIndex,startCommonIndex, startStation, hash);
    var endToCommon = stopList0th(endIndex,endCommonIndex, endStation, hash);
    var stops =(startToCommon + endToCommon.reverse();
    return [stops]
  end
}