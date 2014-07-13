$lines = {
       "N_line" => ['Times Square', '34th', '28th', '23rd', 'Union Square', '8th'],
       "L_line" => ['8th','6th','Union Square','3rd','1st'],
       "6_line" => ['Grand Central','33rd','28th','23rd','Union Square','Astor Place']
      }

    intersect = "Union Square"

    start_index = 0
    end_index = 0
    intersect_start_index = 0
    intersect_end_index = 0

    $lines[@start_line].each_with_index { |val, index|
      start_index = index if val == @start_stop
      intersect_start_index = index if val == intersect
      } # find the index of start_stop

      #start_index = $lines[start_line].index (@start_stop)

    $lines[@ending_line].each_with_index { |val, index|
      end_index = index if val == @ending_stop
      intersect_end_index = index if val == intersect
    }
    if @start_line == @ending_line
      @total_stops = end_index - start_index
    else @start_line != @ending_line
      stops_to_intersect = intersect_start_index - start_index
      stops_from_intersect = intersect_end_index - end_index
      @total_stops = stops_to_intersect.abs + stops_from_intersect.abs
    end

    if start_index > intersect_start_index
      # Revrse the array
      $lines[@start_line].reverse!
      # array length is always start from 1, need to factor in index 0
      lsl = $lines[@start_line].length - 1
      # start index = length - position of start index
      start_index = lsl - start_index
      # do the same for the intersection index
      intersect_start_index = lsl - intersect_start_index
    end

    #Reverse order if end_index is before the union/intersection stop
    if end_index < intersect_end_index
      $lines[@ending_line].reverse!
      lel = $lines[@ending_line].length - 1
      end_index = lel - end_index
      intersect_end_index = lel - intersect_end_index
    end

    @start_names = []
    @end_names = []

    (start_index..intersect_start_index).each do | index |
      @start_names  << "#{$lines[@start_line][index]}"

    end

    if @start_line != @ending_line
      (intersect_end_index..end_index).each do | index |
      @end_names << "#{$lines[@ending_line][index]}"
      end
    end