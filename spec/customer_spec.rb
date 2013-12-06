require './customer'

describe Customer do
  
  let(:customer) { Customer.new }
  let(:takeaway) { double :takeaway }

  it "should have a name" do
    customer.name = "Erica"
    expect(customer.name).to eq("Erica")
  end


#   it "should be able to place an order" do
#     customer.order_food(takeaway)
#     expect(takeaway).to receive(:place_order)
#     # expect(customer.order(takeaway)).to change{takeaway.orders_count}.by(1)
#   end
end