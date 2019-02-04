require_relative("../db/sqlrunner")

class Tickets

  attr_reader :id
  attr_accessor :films_id, :customers_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @films_id = options['films_id'].to_i
    @customers_id = options['customers_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets (films_id, customers_id) VALUES ($1, $2) RETURNING id"
    values = [@films_id, @customers_id]
    tickets = SqlRunner.run(sql, values).first
    @id = tickets['id'].to_i
  end

  def update()
    sql = "UPDATE tickets SET (films_id, customers_id) = ($1, $2) WHERE id = $3"
    values = [@films_id, @customers_id, @id]
    SqlRunner.run(sql, values).first
  end

  def delete()
      sql = "DELETE FROM tickets WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end

    def self.delete_all()
      sql = "DELETE FROM tickets"
      SqlRunner.run(sql)
    end

    def self.all()
      sql = "SELECT * FROM tickets"
      tickets = SqlRunner.run(sql)
      result = tickets.map{|ticket| Tickets.new(ticket)}
      return result
    end

end
