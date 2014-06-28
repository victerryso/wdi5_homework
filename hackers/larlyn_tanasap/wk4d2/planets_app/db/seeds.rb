# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Planet.destroy_all
Planet.create([{ :name => 'Earth', :orbit => 1, :moons => 1},{ :name => 'Mars', :orbit =>4, :moons => 2},{ :name => 'Venus', :orbit => 0.7, :moons => 3}])
Planet.create({ :name => 'Jupiter', :orbit => 3.7, :moons => 7})
Planet.create({ :name => 'Neptune', :orbit => 6, :moons => 3})