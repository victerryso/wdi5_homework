# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Book.destroy_all
Author.destroy_all
osc = Author.create(name:'Orsen Scott Card', nationality: 'USA', dob: '1954-12-04', image:'http://upload.wikimedia.org/wikipedia/commons/6/6e/Orson_Scott_Card_at_BYU_Symposium_20080216_closeup.jpg')
eg = Book.create(title: "Ender's Game", pages:'400', isbn: '412492149122140', image:'http://d.gr-assets.com/books/1388177928l/375802.jpg')