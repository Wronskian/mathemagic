require './magic_int'

describe "MagicInt" do

  context "creating a magic integer" do
    it "should create an object of the class MagicInt" do
      #NYI
    end
    
    it "should create an array containing the integer assigned" do
      #NYI
    end
  end
  
  context "Greatest Common Divisor method (gcd)" do
    it "should calculate the GCD of two integers" do
      big_int = MagicInt.new(1071)
      lil_int = MagicInt.new(462)
      gcd = big_int.gcd(lil_int)
      gcd.should == 21
    end
  end

end