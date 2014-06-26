$ rails new moma -d postgresql
$ cd moma
$ subl .
  Change Gemfile for developement
  Change database.yml
$ bundle
$ rake db:create
$ rails generate migration create_artists
  Edit db/migrate/2014_create_artists.rb
$ rake db:migrate
  Create app/models/artist.rb
$ annotate
$ rails generate migration works
  Edit db/migrate/2014_create_works.rb
$ rake db:migrate
  Create app/models/work.rb
  Edit db/seeds.rb
$  rake db:seed

  Make your routes, controllers, views, etc.

$ rails generate migration add_artist_id_to_works
  Edit db/migrate/2014_add_artist.rb to add_columns
$ rake db:migrate
$ rake db:rollover # use previous migration if you make a mistake

  Edit app/models/artist.rb and work.rb