require_relative('models/ticket')
require_relative('models/film')
require_relative('models/customer')

require('pry-byebug')

cinema_float = 2000

man_bites_dog_a_seats_left = 4
man_bites_dog_b_seats_left = 4

operation_wolf_a_seats_left = 4
operation_wolf_b_seats_left = 4

pans_labyrinth_a_seats_left = 4
pans_labyrinth_b_seats_left = 4

ghost_busters_a_seats_left = 4
ghost_busters_b_seats_left = 4

def capitalise(string)
    stage1 = string.split
    stage2 = stage1.map{|x| x.capitalize}
    result = stage2.join(" ")
    return result
end

customer_array = [
                   {
                     'name' => 'bob smith',
                    'funds' => 20,
                    'film'  => 'Man Bites Dog',
                    'showing' => '1pm'
                   },
                   {
                      'name' => 'jim hunter',
                     'funds' => 40,
                     'film'  => 'Operation Wolf',
                     'showing' => '8pm'
                   },
                   {
                      'name' => 'gareth miles',
                     'funds' => 120,
                     'film'  => 'Man Bites Dog',
                     'showing' => '5pm'
                   },
                   {
                      'name' => 'jimmy cranky',
                     'funds' => 39,
                     'film'  => 'Pans Labyrinth',
                     'showing' => '9pm'
                   }

                 ]

Ticket.delete_all()
Film.delete_all()
Customer.delete_all()


  film1a = Film.new({
    'title' => 'man bites dog',
    'price' => 8,
    'showing' => "1pm"
  })

  film1a.save()

  film1b = Film.new({
    'title' => 'man bites dog',
    'price' => 8,
    'showing' => "5pm"
  })

  film1b.save()

  film2a = Film.new({
    'title' => 'operation wolf',
    'price' =>  5,
    'showing' =>  "2pm"
  })

  film2a.save()

  film2b = Film.new({
    'title' => 'operation wolf',
    'price' =>  5,
    'showing' =>  "8pm"
  })

  film2b.save()

  film3a = Film.new({
    'title' => 'pans labyrinth',
    'price' =>  6,
    'showing' => "3pm"
  })

  film3a.save()

  film3b = Film.new({
    'title' => 'pans labyrinth',
    'price' =>  6,
    'showing' => "9pm"
  })

  film3b.save()

  film4a = Film.new({
    'title' => 'ghost busters',
    'price' =>  4,
    'showing' => "2.30pm"
  })

  film4a.save()

  film4b = Film.new({
    'title' => 'ghost busters',
    'price' =>  4,
    'showing' => "5.45pm"
  })

  film4b.save()

film_array = [film1a,film1b,film2a,film2b,film3a,film3b,film4a,film4b]


print %x{clear}
#p film_array
#p x.id

puts "WELCOME TO THE EXPLODING HEAD CINEMA"
puts "THESE ARE THE FILMS YOU CAN SEE TODAY"
puts ""

puts "Film 1 = #{capitalise(film1a.title)} is a french dark comedy. "
puts "Rating 18. £#{film1a.price} per ticket"
puts "Showing at #{film1a.showing} and #{film1b.showing}"
puts ""

puts "Film 2 = #{capitalise(film2a.title)} is a war movie set in Vietnam. "
puts "Rating 18. £#{film2a.price} per ticket"
puts "Showing at #{film2a.showing} and #{film2b.showing}"
puts ""

puts "Film 3 = #{capitalise(film3a.title)} is a fantasy adventure. "
puts "Rating 15. £#{film3a.price} per ticket"
puts "Showing at #{film3a.showing} and #{film3b.showing}"
puts ""

puts "Film 4 = #{capitalise(film4a.title)} is a classic comedy sci-fi. "
puts "Rating PG. £#{film4a.price} per ticket"
puts "Showing at #{film4a.showing} and #{film4b.showing}"
puts ""
puts ""
puts "Here comes your first customer"


for customer in customer_array
    puts "Hi i would like to see #{customer.values[2]}"
    puts "I'd like to go to the #{customer.values[3]} showing"
    puts ""
    puts "You ask for his name, #{customer.values[0]} he replies"
    puts ""
    puts "Please enter #{customer.values[0]} into the system "
    puts ""
            name = gets.chomp.to_s
    puts ""
    puts ""
         sale = Customer.new({
        'name' => name,
        'funds' => 20
      })
      sale.save

# [#<Film:0x00007fc3e899c830 @title="man bites dog", @price=8, @showing="1pm", @id=1201>,
#   #<Film:0x00007fc3e9903a30 @title="man bites dog", @price=8, @showing="5pm", @id=1202>,
#   #<Film:0x00007fc3e9902978 @title="operation wolf", @price=5, @showing="2pm", @id=1203>,
#   #<Film:0x00007fc3e99013c0 @title="operation wolf", @price=5, @showing="8pm", @id=1204>,
#   #<Film:0x00007fc3e99001f0 @title="pans labyrinth", @price=6, @showing="3pm", @id=1205>,
#   #<Film:0x00007fc3e9123590 @title="pans labyrinth", @price=6, @showing="9pm", @id=1206>,
#   #<Film:0x00007fc3e9122a00 @title="ghost busters", @price=4, @showing="2.30pm", @id=1207>,
#   #<Film:0x00007fc3e9121e70 @title="ghost busters", @price=4, @showing="5.45pm", @id=1208>]

      film_search = film_array.find { |film| film.title == customer.values[2].downcase && film.showing == customer.values[3] }
  puts "how many tickets?"

      input2 = gets.chomp.to_i

      until input2 == 1 || input2 == 2 || input2 == 3 || input2 == 4 || input2 == 5 || input2 == 6 || input2 == 7 || input2 == 8 || input2 == 9
        puts "try again, single digits please"
        input2 = gets.to_i
      end
      counter = input2
      while counter >= 0
        ticket = Ticket.new({'film_id' => film_search.id, 'customer_id' => sale.id})
        ticket.save
        counter -= 1
      end



      #p customer.all
      #p ticket.all
      #p film.all
      # customer1 = Customer.new({
      #   'name' => 'bob smith',
      #   'funds' => 20
      # })
  #p customer
  #p customer1






  puts ""
  puts ""
  puts ""
  print %x{clear}
 end
puts ""
puts  "Thanks for playing"

puts Ticket.all
puts Customer.all
puts Film.all

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
