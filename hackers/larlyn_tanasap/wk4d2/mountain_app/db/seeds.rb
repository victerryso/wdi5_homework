# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Mountain.destroy_all
Mountain.create({:name => 'Mount Vesuvius', :image => 'http://upload.wikimedia.org/wikipedia/commons/0/00/Joseph_Wright_of_Derby_-_Vesuvius_from_Portici.jpg', :height => 4203, :first_climb => 0, :country => 'Italy'})
Mountain.create({:name => 'Mount Kosciuszko', :image => 'http://upload.wikimedia.org/wikipedia/commons/e/e1/Mount_Kosciuszko01Oct06.JPG', :height => 7310, :first_climb => 1840, :country => 'Australia'})
Mountain.create({:name => 'Mount Everest', :image => 'http://upload.wikimedia.org/wikipedia/commons/4/4b/Everest_kalapatthar_crop.jpg', :height => 29029, :first_climb => 1953, :country => 'Nepal'})
Mountain.create({:name => 'Aconcagua', :image => 'http://upload.wikimedia.org/wikipedia/commons/4/4b/Everest_kalapatthar_crop.jpg', :height => 6961, :first_climb => 1897, :country => 'Argentina'})