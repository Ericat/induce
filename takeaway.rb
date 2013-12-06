require 'rest-client'

class Takeaway

  def initialize
    @dishes = { :pizza => 7.5, 
                :cola => 2.5,
                :ice_cream => 3
              }
  end

  def menu
    @dishes.each do |key, value|
      puts "#{key}: #{value}£ ".rjust(10, ' ')
    end
  end

  def place_order(order, price)
    raise "Incorrect amount!" unless correct_amount?(order, price)
    return @total
    send_email
  end

  def correct_amount?(order, price)
   items = order.keys
   @total = items.map { |item| @dishes[item] * order[item] }.inject(:+)
   @total == price
  end

  def send_email
     RestClient.post "https://api:key-0twodrlfbocpmtukjqp7tmsbotln4xg5"\
    "@api.mailgun.net/v2/sandbox3443.mailgun.org/messages",
        :from => "Excited User <erica.salvaneschi@hotmail.com>",
        :to => "erica.salvaneschi@hotmail.com",
        :subject => "Your order is on its way!",
        :text => "Testing some Mailgun awesomness!"
  end
 
end


