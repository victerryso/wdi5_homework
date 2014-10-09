require 'pry'
require 'pry-debugger'

hackers = "Wendy Quek,BIll Searle,David Mesaros,Rosalind Skinner,Larlyn Tanasap,Daisy Smith,Xaun Lopez,Rich Field,Tommy Mitchell,Victerry So,Fai Weiner,Allen Hsu,Rira Choi,Yuko Sugiyama".split(',')

print "Group size? "
group_size_input = gets.chomp.to_i

number_of_groups = ( hackers.length / group_size_input ).floor

groups_array = []

hackers.shuffle!
number_of_groups.times do |group|
  group = []
  group_size_input.times do |name|
    group << hackers.pop
  end
  groups_array << group
end

hackers.each_with_index do |name, index|
 groups_array[index % groups_array.length] << name
end 

# number_of_groups.times do |group|
#   group = []
#   group_size_input.times do |name|
#     group << hackers.delete_at(rand(hackers.length))
#   end
#   groups_array << group
# end

# count = 0
# hackers.each do |loner|
#   groups_array[count] << loner
#   count += 1
# end

groups_array.each_with_index do |group, index|
  puts "Group #{index + 1} with #{group}"
end