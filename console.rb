require('pry')
require_relative('models/movie')
require_relative('models/star')

Movie.delete_all
Star.delete_all

movie1 = Movie.new({
  'title' => 'Forest Gump',
  'genre' => 'Comedy'
})
movie1.save

star1 = Star.new({
  'forename' => 'Tom',
  'surname' => 'Hanks'
})
star1.save


binding.pry
nil
