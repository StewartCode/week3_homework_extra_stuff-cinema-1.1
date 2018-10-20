require_relative('models/ticket')
require_relative('models/film')
require_relative('models/customer')

require('pry-byebug')

def capitalise(string)
    stage1 = string.split
    stage2 = stage1.map{|x| x.capitalize}
    result = stage2.join(" ")
    return result
end

Ticket.delete_all()
Film.delete_all()
Customer.delete_all()


  film1 = Film.new({
    'title' => 'man bites dog',
    'price' => 8
  })

  film1.save()
  # z = film1.title
  # title1 = capitalise(z)
  # p title1

  film2 = Film.new({
    'title' => 'operation wolf',
    'price' =>  5
  })

  film2.save()

  film3 = Film.new({
    'title' => 'pans labyrinth',
    'price' =>  6
  })

  film3.save()

  film4 = Film.new({
    'title' => 'ghost busters',
    'price' =>  4
  })

  film4.save()

print %x{clear}


puts "WELCOME TO THE EXPLODING HEAD CINEMA"
puts "THESE ARE THE FILMS YOU CAN SEE TODAY"
puts ""

puts "Film 1 = #{capitalise(film1.title)} is a french dark comedy. "
puts "Rating 18. £8 per ticket"
puts ""

puts "Film 2 = #{capitalise(film2.title)} is a war movie set in Vietnam. "
puts "Rating 18. £5 per ticket"
puts ""

puts "Film 3 = #{capitalise(film3.title)} is a fantasy adventure. "
puts "Rating 15. £6 per ticket"
puts ""

puts "Film 4 = #{capitalise(film4.title)} is a classic comedy sci-fi. "
puts "Rating PG. £4 per ticket"
puts ""

p film1.title

#________________________________________

  # customer1 = Customer.new({
  #   'name' => 'bob smith',
  #   'funds' => 20
  # })
  #
  # customer1.save()
  #
  #
  # customer2 = Customer.new({
  #   'name' => 'jim hunter',
  #   'funds' => 40
  # })
  #
  # customer2.save()
  #
  # customer3 = Customer.new({
  #   'name' => 'gareth miles',
  #   'funds' => 120
  # })
  #
  # customer3.save()
  #
  # customer4 = Customer.new({
  #   'name' => 'jimmy cranky',
  #   'funds' => 39
  # })
  #
  # customer4.save()
  #
  # ticket1 = Ticket.new({'film_id' => film1.id, 'customer_id' => customer1.id})
  # ticket2 = Ticket.new({'film_id' => film2.id, 'customer_id' => customer2.id})
  # ticket3 = Ticket.new({'film_id' => film3.id, 'customer_id' => customer3.id})
  # ticket4 = Ticket.new({'film_id' => film4.id, 'customer_id' => customer4.id})
  # ticket5 = Ticket.new({'film_id' => film2.id, 'customer_id' => customer1.id})
  # ticket6 = Ticket.new({'film_id' => film3.id, 'customer_id' => customer2.id})


 # ticket1.save()
 # ticket2.save()
 # ticket3.save()
 # ticket4.save()
 # ticket5.save()
 # ticket6.save()
 #
 # Ticket.all()
 # Film.all()
 # Customer.all()
 #
 # customer1.films
 #
 # film2.customers

 # customer1.name = "test name"
 # customer1.update

 # film1.title = "test name"
 # film1.update

#binding.pry
#nil
