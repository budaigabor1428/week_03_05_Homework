require_relative("../db/sqlrunner")

class Customers

  attr_reader :id
  attr_accessor :name, :fund

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @fund = options['fund'].to_i
  end

  def films()
  sql = "SELECT films.* FROM films
         INNER JOIN tickets
         ON tickets.films_id = films.id
         WHERE tickets.customers_id = $1"
  values = [@id]
  films = SqlRunner.run(sql, values)
  result = films.map { |film| Films.new(film) }
  return result
end

  def save()
    sql = "INSERT INTO customers (name, fund) VALUES ($1, $2) RETURNING id"
    values = [@name, @fund]
    customers = SqlRunner.run(sql, values).first
    @id = customers['id'].to_i
  end

  def update()
    sql = "UPDATE customers SET (name, fund) = ($1, $2) WHERE id = $3"
    values = [@name, @fund, @id]
    SqlRunner.run(sql, values).first
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    values = []
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM customers"
    values = []
    customers = SqlRunner.run(sql, values)
    result = customers.map{|customer| Customers.new(customer)}
    return result
  end

end
