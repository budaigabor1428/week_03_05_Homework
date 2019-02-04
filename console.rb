require_relative('models/tickets')
require_relative('models/films')
require_relative('models/customers')

require('pry-byebug')

Tickets.delete_all()
Films.delete_all()
Customers.delete_all()

  film1 = Films.new({
    'title' => 'Casino',
    'price' => 10
  })
  film1.save()

  film2 = Films.new({
    'title' => 'Hot Fuzz',
    'price' => 12
  })
  film2.save()
  #
  # film3 = Films.new({
  #   'title' => 'Django Unchained',
  #   'price' => 14
  # })
  # movie3.save()
  #
  customer1 = Customers.new({
    'name' => 'John Carter',
    'fund' => 200
  })
  customer1.save()

  customer2 = Customers.new({
    'name' => 'Jane Carter',
    'fund' => 300
  })
  customer2.save()
  #
  # customer3 = Customers.new({
  #   'name' => 'Jimmy Carter',
  #   'fund' => 250
  # })
  # customer3.save()

  ticket1 = Tickets.new({'customers_id' => customer1.id, 'films_id' => film1.id})
  ticket2 = Tickets.new({'customers_id' => customer2.id, 'films_id' => film2.id})
  # ticket3 = Tickets.new({'customers_id' => customer3.id, 'films_id' => film3.id})

  ticket1.save()
  ticket2.save()
  # ticket3.save()

  Tickets.all()
  Films.all()
  Customers.all()

  binding.pry
  nil
