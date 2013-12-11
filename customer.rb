require_relative 'takeaway'

class Customer

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def order_food(takeaway, order, price)
    takeaway.place_order(order, price)
  end

end