require('pry')

require_relative('../db/sql_runner')
require_relative('./movie')

class Star

  attr_reader :forename, :surname, :id, :income

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @forename = options['forename']
    @surname = options['surname']
    @income = 0
  end

  def save
    sql = "
      INSERT INTO stars (forename, surname) VALUES ($1, $2) RETURNING * "
    values = [@forename, @surname]
    star = SqlRunner.run(sql, values)[0]
    @id = star['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM stars"
    SqlRunner.run(sql)
  end

  def movies
    sql = "
      SELECT movies.* FROM movies
      INNER JOIN castings
      ON castings.movie_id = movies.id
      WHERE star_id = $1"
    values = [@id]
    movies_info = SqlRunner.run(sql, values)
    movies_info.map { |movie| Movie.new(movie)}
  end

  def find_castings_by_star
    sql = "SELECT fee FROM castings
    WHERE star_id = $1 "
    values = [@id]
    star_casting_info = SqlRunner.run(sql, values)
    return star_casting_info.map { |casting| Casting.new(casting)}
    # fees_array.each { |casting, fee| casting['fee'] }
    # fees_only = fees_array
  end

  def income_after_receiving_fees
    star_castings = self.find_castings_by_star
    star_casting_fees = star_castings.map { |casting| casting.fee}
    total_fees_received = star_casting_fees.reduce(:+) # (:+) is a quick way to sum the numbers, and I have used it instead of a block
    @income += total_fees_received
  end


end


__END__

@id = SqlRunner.run(sql, values)[0]['id'].to_i
