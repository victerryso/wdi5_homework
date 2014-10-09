hackers = "Wendy Quek,BIll Searle,David Mesaros,Rosalind Skinner,Larlyn Tanasap,Daisy Smith,Xaun Lopez,Rich Field,Tommy Mitchell,Victerry So,Fai Weiner,Allen Hsu, Rira Choi,Yuko Sugiyama".split(',')
hack = []



hackers.each do |hacker|
  folder_name = hacker.gsub(' ','_').downcase
end

hackers.each do |x|
  hack << "#{x}"
end

hack.shuffle!

puts "How many groups?"; no_groups = gets.chomp.to_i
max_people = hack.length
no_people = max_people / no_groups
remaining = max_people % no_groups

no_groups.times do |x|
  puts "\nGroup #{x + 1}"
  no_people.times { |x| puts hack.pop }
end

remaining.times { |x| puts hack.pop }
