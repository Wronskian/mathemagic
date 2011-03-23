require './fraction'
require './magic_int'

describe "Fraction" do
  
  context "creating a new fraction" do
    it "should create an fraction class object" do
      fraction = Fraction.new(1,2)
      fraction.class.should == Fraction
    end
    
    it "should create a fraction as entered" do
      fraction = Fraction.new(2,3)
      fraction.numerator.should == 2
      fraction.denominator.should == 3
    end
  end
  
  context "multiplying fraction objects" do
    it "should be able to multiply a fraction by another fraction" do
      half = Fraction.new(1,2)
      quarter = Fraction.new(1,4)
      product = half * quarter
      product.should == Fraction.new(1,8)
    end
    
    it "should be able to multiply a fraction by an integer" do
      fraction = Fraction.new(1,5)
      integer = MagicInt.new(5)
      product = fraction * integer
      product.should == Fraction.new(5,5)
    end
  end
end