Genre.destroy_all
Song.destroy_all
Artist.destroy_all
Album.destroy_all
Mixtape.destroy_all
User.destroy_all

g1 = Genre.create(:name => 'Dubstep')
g2 = Genre.create(:name => 'Indie Rock')
g3 = Genre.create(:name => 'Classical')
g4 = Genre.create(:name => 'Baroque Pop')

s1 = Song.create(:title => 'We are young')
s2 = Song.create(:title => 'Settler')
s3 = Song.create(:title => 'Carry On')

r1 = Artist.create(:name => "Fun.")
r2 = Artist.create(:name => "Balmorhea")

a1 = Album.create(:name => "All is wild, All is silent")
a2 = Album.create(:name => "Some Nights")

u1 = User.create(:username => "bob", :password => "lol", :password_confirmation => "lol")
u2 = User.create(:username => "mary", :password => "lol", :password_confirmation => "lol", :is_admin => true)

m1 = Mixtape.create(:name => "Happy")
m2 = Mixtape.create(:name => "Sad")

r1.songs = [s1, s3]
r1.save
r2.songs << s2

a1.songs << s3
s1.album = a2
s1.save

s1.genres << g2 << g4
g2.songs = [s2]
g2.save
s3.genres << g2 << g4

u1.mixtapes << m1
u2.mixtapes << m2

m1.songs << s1 << s2
m2.songs << s2 << s3