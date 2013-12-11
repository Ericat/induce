require './induce'

describe Array do

  let(:array) { Array.new }

  it "should sum some numbers" do
    array = [2, 3, 4]
    expect(array.induce { |sum, value| sum + value }).to eq(9)
  end

  it "should sum more numbers" do
    array = [1, 2, 5]
    expect(array.induce() { |sum, value| sum + value }).to eq(8)
  end

  # this test fails because your code doesn't expect an argument
  it "should take an argument" do
    array = [1, 2, 5]
    expect(array.induce(10) { |sum, value| sum + value }).to eq(18)
  end
  
end