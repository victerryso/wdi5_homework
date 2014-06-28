# Write a small archiving program that stores students along with the grade that they are in.

# school = School.new("Haleakala Hippy School")
# If no students have been added, the db should be empty:

# school.db
# # => {}
# When you add a student, they get added to the correct grade.

# school.add("James", 2)
# school.db
# # => {2 => ["James"]}
# You can, of course, add several students to the same grade, and students to different grades.

# school.add("Phil", 2)
# school.add("Jennifer", 3)
# school.add("Little Billy", 1)
# school.db
# # => {2 => ["James", "Blair"], 3 => ["Jennifer"], 1 => ["Little Billy"]}
# Also, you can ask for all the students in a single grade:

# school.grade(2)
# # => ["James", "Blair"]
# extension
# Lastly, you should be able to get a sorted list of all the students. Grades are sorted in descending order numerically, and the students within them are sorted in ascending order alphabetically.

# school.sort
# # => {1 => ["Little Billy"], 2 => ["Blair", "James"], 3 => ["Jennifer"]}


require "pry"
require "pry-debugger"

class School
  attr_accessor :name, :student, :grade, :db

  def initialize(name)
    @name = name
    @db = Hash.new {|x,y| x[y]=[]} # Found on google. Creates a hash with empty arrays as the values.
  end

  def add(student, grade)
    @db[grade] ||= [] # If grade does not exist, give it an array.
    @db[grade] << student # Pushing student into the value array corresponding to the grade key.
  end

  def grade(grade)
    @db[grade] # Check which students have the grade parameter given.
  end

  def sort
    @db.each_value {|v| v.sort!} # For each value in db, we sort the array.
    @db = Hash[@db.sort] # Sort hash keys.
  end

end

p school = School.new("Haleakala Hippy School")
p school.db
p school.add("Phil", 2)
p school.db
p school.add("James", 2)
p school.add("Jennifer", 3)
p school.add("Little Billy", 1)
p school.db
p school.grade(2)
puts ""
p school.sort
p school