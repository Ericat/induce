require './takeaway'

describe Takeaway do

  let(:takeaway) { Takeaway.new }

  it "should calculate the correct order amount" do
    order = {:pizza => 2, :ice_cream => 1}
    price = 18.0
    expect(takeaway.correct_amount?(order, price)).to be_true
  end

  it "places the order for two pizzas and an ice cream" do
    order = {:pizza => 2, :ice_cream => 1}
    price = 18.0
    expect(takeaway.place_order(order, price)).to be_true
    allow(takeaway).to receive(:send_email).with("Your order is on its way!")
  end

  it "should raise an error if we are not passing the correct amount" do
    order = {:pizza => 2, :ice_cream => 1}
    price = 22
    expect {takeaway.place_order(order, price)}.to raise_error(RuntimeError, "Incorrect amount!")
    allow(takeaway).to receive(:send_email).with("Your order is on its way!")
  end

  it "should send an email after order is placed" do
    order = {:pizza => 2, :ice_cream => 1}
    price = 18.0
    takeaway.place_order(order, price)
    allow(takeaway).to receive(:send_email).with("Your order is on its way!")
  end
end
