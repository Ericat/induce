# require 'bundler/setup'
# require 'twilio-ruby'

class Takeaway

  def initialize
    @dishes = { :pizza => 7.5, 
                :cola => 2.5,
                :ice_cream => 3
              }
  end

  def place_order(order, price)
    raise "Incorrect amount!" unless correct_amount?(order, price)
    # correct_amount?(order, price) ? send_text : raise "Incorrect amount!"
    return @total
  end

  def correct_amount?(order, price)
   items = order.keys
   @total = items.map { |item| @dishes[item] * order[item] }.inject(:+)
   @total == price
  end

  def send_text
  end


end