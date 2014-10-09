lines = {
   :n =>["Times Square", "34th", "28th", "23rd", "Union Square", "8th" ],
   :l => ["8th", "6th", "Union Square", "3rd", "1st"],
   :"L6" => ["Grand Central" , "33rd", "28th", "23th", "Union Square", "Astor Place"]
}


def user_choice
	puts "Welcome, which NYC Subway line would like to go on"
	puts "(n) line "
	puts "(l) line "
	puts "(L6) line "

	user_pick = gets.chomp.downcase
end
user_pick = user_choice.downcase



   # Try changing 'n' to 'l' below to see the other line:
   user_choice = 'n' # pretend we read this from the keyboard with gets.chomp
   stops = lines[ user_choice.to_sym ] # need to convert 'n' string to :n symbol
   

   stops.each do |stop|
       puts "Here is the stop on this line: #{stop}"
   end











   










