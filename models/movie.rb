require('pry')

require_relative('../db/sql_runner')
require_relative('./star')


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

  #create a function that will return the remaining budget once all a movie's star's fees have been taken into consideration! This requires: 1 - get the fees from the castings table in the imdb database; 2 - create an array of fees, called fees; 3 - sum the values of the items in the fees array, resulting in total_fees variable; 4 - subtract the total fees from the , budget-total_fees.
  def find_castings_by_movie
    sql = "SELECT fee FROM castings
    WHERE movie_id = $1 "
    values = [@id]
    movie_casting_info = SqlRunner.run(sql, values)
    return movie_casting_info.map { |casting| Casting.new(casting)}
    # fees_array.each { |casting, fee| casting['fee'] }
    # fees_only = fees_array
  end

  def budget_after_paying_fees
    castings = self.find_castings_by_movie
    casting_fees = castings.map { |casting| casting.fee}
    total_fees_paid = casting_fees.reduce(:+) # (:+) is a quick way to sum the numbers, and I have used it instead of a block
    @budget -= total_fees_paid
  end

end
