require('pry')

require_relative('../db/sql_runner')

class Star

  attr_reader :forename, :surname, :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @forename = options['forename']
    @surname = options['surname']
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

end


__END__

@id = SqlRunner.run(sql, values)[0]['id'].to_i
