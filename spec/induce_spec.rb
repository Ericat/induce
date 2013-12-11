require './induce'

describe Array do

  let(:array) { Array.new }

  it "should sum some numbers" do
    array = [2, 3, 4]
    expect(array.induce { |sum, value| sum + value }).to eq(9)
  end

    it "should sum more numbers" do
    array = [1, 2, 5]
    expect(array.induce { |sum, value| sum + value }).to eq(8)
  end

  it "should be able to take a parameter" do
    array = [1, 2, 5]
    expect(array.induce(5) {|sum, value| sum + value }).to eq(13)
  end

    it "should be able to take a parameter" do
    array = [4, 5, 6]
    expect(array.induce(5) {|sum, value| sum + value }).to eq(20)
  end

    it "should take an argument" do
     array = [1, 2, 5]
     expect(array.induce(10) { |sum, value| sum + value }).to eq(18)
   end
  
end