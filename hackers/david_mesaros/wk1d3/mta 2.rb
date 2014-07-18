lines = {
   :n =>["Times Square", "34th", "28th", "23rd", "Union Square", "8th" ],
   :l => ["8th", "6th", "Union Square", "3rd", "1st"],
   :s => ["Grand Central" , "33rd", "28th", "23rd", "Union Square", "Astor Place"]
}

def menu

	puts "Welcome, which NYC Subway line would like to go on"
	puts "line (n) "
	puts "line (l) "
	puts "line (s) "
	puts "Or (q)uit"
    puts = gets.chomp.downcase

end

	user_choice = menu
	if user_choice == "n"
    	puts " You have Picked Line (n)"
        puts "================"
        puts  " Here are the stops on this line!"
    	lines[:n].each{|x| puts x} 
    	
       puts  " Please select your departure"
    	      start = gets.chomp
    	puts " You selcetd #{start}"
    	
        puts "Please select your destination"
             finish = gets.chomp
        puts " You selected #{finish}"  
      
        first_line = lines[:n]
        hash = Hash[first_line.map.with_index.to_a] # it convert array created a hash with the above values on line n and map out the index ie 0, 1, and convert into back into an array this way i can get my x - y  
    
         x = hash["#{start}"]
         y = hash["#{finish}"]
         p hash.rand(x..y)
         number_of_stops = y - x 
         puts  " there are #{number_of_stops} stops to your destination"
    
    	
    elsif user_choice == "l"
    	puts " You have Picked Line (l)"
    	lines[:l].each{|x| puts x}
        puts  " Here are the stops on this line!"
        puts  " Please select your departure"
              start = gets.chomp
        puts " You selcetd #{start}"
        
        puts "Please select your destination"
             finish = gets.chomp
        puts " You selected #{finish}"  
      
        first_line = lines[:l]
        hash = Hash[first_line.map.with_index.to_a]
         x = hash["#{start}"]
         y = hash["#{finish}"]
         p hash.rand(x..y).map
         number_of_stops = y - x 
         puts  " there are #{number_of_stops} stops to your destination"
      
      elsif user_choice == "s"
        puts " You have Picked Line (s)"
        lines[:s].each{|x| puts x} # the each function shows x in the array
        puts  " Here are the stops on this line!"
        puts  " Please select your departure"
              start = gets.chomp
        puts " You selcetd #{start}"
        
        puts "Please select your destination"
             finish = gets.chomp
        puts " You selected #{finish}"  
      
        first_line = lines[:s]
        hash = Hash[first_line.map.with_index.to_a]
         x = hash["#{start}"]
         y = hash["#{finish}"]
         
         number_of_stops = y - x 
         puts  " there are #{number_of_stops} stops to your destination"
      
         
     else user_choice == "q"
    	puts "Quiting"
    	Kernel.exit
 	end
 

     while true
         menu
         break user_choice = false

      end
  
      # first_line = lines[:n]
      # hash = Hash[first_line.map.with_index.to_a]
      # x = hash["#{start}"]
      # y = hash["#{finish}"]

      # puts  x
      # puts  y

      # puts y - x 
    

# Hash[]





