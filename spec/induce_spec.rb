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
  
end