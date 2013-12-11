require './takeaway'

describe Takeaway do

  let(:takeaway) { Takeaway.new }
  let(:customer) { double :customer, :name => "Erica" }
  let(:order) { {:pizza => 2, :ice_cream => 1} }

  it "should calculate the correct order amount" do
    price = 18.0
    expect(takeaway.correct_amount?(order, price)).to be_true
  end

  it "places the order for two pizzas and an ice cream" do
    price = 18.0
    allow(takeaway).to receive(:send_email).with(customer)    
    expect(takeaway.place_order(order, price, customer)).to eq(18.0)
    # you should also have the expectation if you stubbing the method on line 16
    expect(takeaway).to have_received(:send_email)
  end

  it "should raise an error if we are not passing the correct amount" do
    price = 22
    allow(takeaway).to receive(:send_email).with(customer)
    expect {takeaway.place_order(order, price, customer)}.to raise_error(RuntimeError, "Incorrect amount!")
  end

  # This test doesn't check that the email is sent as promised
  # You're already doing this on lines 16 and 19, though, so this test can be deleted
  # 
  # The biggest problem with this test, though, is that it doesn't stub send_email
  # so you get an email (I guess) every time I run this code. Your tests should always
  # stub external requests
  it "should send an email after order is placed" do
    price = 18.0    
    takeaway.place_order(order, price, customer)
  end
end
