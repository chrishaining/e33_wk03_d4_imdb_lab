require('pry')
require_relative('models/movie')


movie1 = Movie.new({
  'title' => 'Forest Gump',
  'genre' => 'Comedy'
})
movie1.save


binding.pry
nil
