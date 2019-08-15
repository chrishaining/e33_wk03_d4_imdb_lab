require('pry')
require_relative('models/movie')
require_relative('models/star')
require_relative('models/casting')


Movie.delete_all
Star.delete_all
Casting.delete_all

movie1 = Movie.new({
  'title' => 'Forest Gump',
  'genre' => 'Comedy',
  'budget' => 20_000_000
})
movie1.save

movie2 = Movie.new({
  'title' => 'California Typewriter',
  'genre' => 'Documentary',
  'budget' => 12_000_000
})
movie2.save

star1 = Star.new({
  'forename' => 'Tom',
  'surname' => 'Hanks'
})
star1.save

star2 = Star.new({
  'forename' => 'Sally',
  'surname' => 'Field'
})
star2.save

star3 = Star.new({
  'forename' => 'Robin',
  'surname' => 'Wright'
})
star3.save

casting1 = Casting.new( { 'movie_id' => movie1.id, 'star_id' => star1.id, 'fee' => '10000000'})
casting1.save

casting2 = Casting.new( { 'movie_id' => movie1.id, 'star_id' => star2.id, 'fee' => '500'})
casting2.save

casting3 = Casting.new( { 'movie_id' => movie1.id, 'star_id' => star3.id, 'fee' => '750000'})
casting3.save

casting4 = Casting.new( { 'movie_id' => movie2.id, 'star_id' => star1.id, 'fee' => '5000'})
casting4.save

binding.pry
nil
