require_relative("../db/sql_runner")

class Film
  attr_reader :id
  attr_accessor :title, :price, :showing

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price'].to_i
    @showing = options['showing']
  end

  def save()
    sql = "INSERT INTO films
          (title,
           price,
           showing
          )
           VALUES
          ($1, $2, $3)
           RETURNING id"
    values = [@title, @price, @showing]
    movie = SqlRunner.run(sql, values).first
    @id = movie['id'].to_i
  end

  def update()
    sql = "UPDATE films
           SET (title,
                price,
                showing
              )
           = ($1, $2, $3)
           WHERE id = $4"
    values = [@title, @price, @showing, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE *
           FROM films
           WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end


  def customers()
    sql = "SELECT customers.*
           FROM customers
           INNER JOIN tickets
           ON customers.id = tickets.customer_id
           WHERE film_id = $1"
    values = [@id]
    data = SqlRunner.run(sql, values)
    return Customer.map_items(data)
  end

  def tickets()
    sql = "SELECT *
           FROM tickets
           WHERE movie_id = $1"
    values = [@id]
    t_data = SqlRunner.run(sql, values)
    return t_data.map{|t| Ticket.new(t)}
  end

  def self.all()
    sql = "SELECT * FROM films"
    f = SqlRunner.run(sql)
    return Film.map_items(f)
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end

  def self.map_items(data)
    result = data.map{|f| Film.new(f)}
    return result
  end

end
