require './customer'

describe Customer do
  
  let(:customer) { Customer.new("Erica") }
  let(:takeaway) { double :takeaway }

  it "should have a name" do
    expect(customer.name).to eq("Erica")
  end

  it "should be able to place the order" do
    order = {:pizza => 2, :ice_cream => 1}
    price = 18.0
    expect(takeaway).to receive(:place_order).with(order, price)
    customer.order_food(takeaway, order, price)
  end
end