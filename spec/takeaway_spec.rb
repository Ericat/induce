require './takeaway'

describe Takeaway do

  let(:takeaway) { Takeaway.new }
  let(:customer) { double :customer }
  let(:order) { {:pizza => 2, :ice_cream => 1} }

  before do
    customer.stub(:name) {"Erica"}
  end

  it "should calculate the correct order amount" do
    price = 18.0
    expect(takeaway.correct_amount?(order, price)).to be_true
  end

  it "places the order for two pizzas and an ice cream" do
    price = 18.0
    allow(takeaway).to receive(:send_email).with(customer)
    expect(takeaway.place_order(order, price, customer)).to eq(18.0)
  end

  it "should raise an error if we are not passing the correct amount" do
    price = 22
    allow(takeaway).to receive(:send_email).with(customer)
    expect {takeaway.place_order(order, price, customer)}.to raise_error(RuntimeError, "Incorrect amount!")
  end

  it "should send an email after order is placed" do
    price = 18.0
    takeaway.place_order(order, price, customer)
  end
end
