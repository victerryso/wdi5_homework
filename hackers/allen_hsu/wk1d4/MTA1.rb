Lines = {
  :N => [:N_Times_Square,:N_34th,:N_28th,:N_23rd,:Union_Square,:N8th],
  :L => [:L8th,:L_6th,:Union_Square,:L_3rd,:L_1st],
  :L6 => [:L6_Grand_Central,:L6_33rd,:L6_28th,:L6_23rd,:Union_Square,:L6_Astor_Place]
}
#helpers
def input(message)
  print message
  output = nil
  loop do
    begin
      output = Integer(gets.chomp)
    rescue
      puts "Put integer"
    end
    break if output.class == Fixnum
  end
  output
end

def display_options(array)
  array.each_with_index do |item, index|
    puts "#{index}. #{item.to_s}"
  end
end

def options_select (array)
  display_options(array)
  choice = nil
  while !array.include?(choice)
    choice = array[input("Choice?")]
    if !array.include?(choice)
      puts "Choose a number from the list"
    end
  end
  choice
end
#stop listers
def stops_on_journey (start_index, stop_index, line_and_station, hash)
  stops = []
  number_of_stops = (start_index-stop_index)
  #(begin).step(end,stepsize)
  begin
    (start_index).step(stop_index, stop_index <=> start_index) do |x|
      stops << hash[line_and_station[:line]][x]
    end
  rescue
      stops = []
  end
  stops
end
#stops list returns [stops] or [stops, common]
def stops_list(hash, start_station, end_station)
  stops =[]
  common = hash[start_station[:line]] & hash[end_station[:line]]
  start_index = hash[start_station[:line]].index(start_station[:station])
  start_common_index = hash[start_station[:line]].index(common[-1])
  end_index = hash[end_station[:line]].index(end_station[:station])
  end_common_index = hash[end_station[:line]].index(common[-1])

  if start_station[:line] == end_station[:line]
    return [stops_on_journey(start_index,end_index,start_station,hash)]
  else
    start_to_common = stops_on_journey(start_index,start_common_index, start_station, hash)
    end_to_common = stops_on_journey(end_index,end_common_index, end_station, hash)
    stops =(start_to_common + end_to_common.reverse).uniq
    return [stops, common]
  end
end
#start menu
def menu(hash)
  loop do
    journey = {
      'starting' => {
        :line => nil,
        :station => nil
        },
      'ending' => {
        :line => nil,
        :station => nil
      }
    }

    journey.keys.each do |point|
      puts `clear`
      puts "what line are you #{point}?"
      journey[point][:line] = options_select(hash.keys)

      puts `clear`
      puts "Station Listing at #{journey[point][:line]} Line"
      #check if starting is available and remove from list
      if !journey['starting'][:line].nil?
        journey[point][:station] = options_select(temp = hash[journey[point][:line]].dup.delete_if{|x| x == journey['starting'][:station]})
      else
        journey[point][:station] = options_select(hash[journey[point][:line]])
      end
    end
    puts "#{journey['starting'][:line]} Line: #{journey['starting'][:station]} Station to #{journey['ending'][:line]} Line: #{journey['ending'][:station]}"
    stops = stops_list(hash, journey['starting'], journey['ending'])
    display_options(stops[0])
    puts "Total station count is #{stops[0].length}"

    if !stops[1].nil?
      puts "Can change trains at:"
      display_options(stops[1])
    end
    response = input("Another trip? 1 to quit")
    break if response == 1
  end
end

menu(Lines)
