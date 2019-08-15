require('pry')

require_relative('../db/sql_runner')

class Movie

  attr_reader :title, :genre, :id
  attr_accessor :budget

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @budget = options['budget']
  end

  def save
    sql = "INSERT INTO movies (title, genre, budget) VALUES ($1, $2, $3) RETURNING * "
    values = [@title, @genre, @budget]
    movie = SqlRunner.run(sql, values)[0]
    @id = movie['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM movies"
    SqlRunner.run(sql)
  end

  def stars
    sql = "SELECT stars.* FROM stars
      INNER JOIN castings
      ON castings.star_id = stars.id
      WHERE movie_id = $1"
    values = [@id]
    stars_info = SqlRunner.run(sql, values)
    stars_info.map { |star| Star.new(star) }
  end



  def pay_fees
    sql = "SELECT fee FROM castings
      WHERE star_id = $1 "
    values = [@id]


  end

end
