require_relative("../db/sql_runner")

class Ticket

  attr_reader :id
  attr_accessor :film_id, :customer_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @film_id = options['film_id'].to_i
    @customer_id = options['customer_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets (
    film_id,
    customer_id
    )
    VALUES ($1, $2)
    RETURNING id"
    values = [@film_id, @customer_id]
    casting = SqlRunner.run(sql, values)[0];
    @id = casting['id'].to_i
  end

  def update()
    sql = "UPDATE tickets
    SET
    (film_id,
     customer,
     fee) = ($1, $2, $3)
    WHERE id = $4"
    values = [@film_id, @customer_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE *
           FROM tickets
           WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def movie()
    sql = "SELECT *
           FROM tickets
           WHERE id = $1"
    values = [@film_id]
    film = SqlRunner.run(sql, values).first
    return Film.new(film)
  end

  def customer()
    sql = "SELECT *
           FROM customers
           WHERE id = $1"
    values = [@star_id]
    customer = SqlRunner.run(sql, values).first
    return Customer.new(customer)
  end

  def self.all()
    sql = "SELECT *
           FROM tickets"
    stuff = SqlRunner.run(sql)
    return stuff.map{|ticket| Ticket.new(ticket)}
  end

  def self.delete_all()
    sql = "DELETE
           FROM tickets"
    SqlRunner.run(sql)
  end

end
