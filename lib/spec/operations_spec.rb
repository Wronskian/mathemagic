require './matrix'
require './scalar'

describe "Operations" do

  context "Multiplication (*)" do
    it "should be able to multiply numbers" do
      product = 5 * 5
      product.should == 25
    end
  
    it "should be able to multiply matricies" do
      matrix_1 = Matrix.new(:from_array => [[ 1, 1, 1 ], [ 1, 1, 1 ], [ 1, 1, 1 ]])
      matrix_2 = Matrix.new(:from_array => [[ 2, 2, 2 ], [ 2, 2, 2 ], [ 2, 2, 2 ]])
      check_product = Matrix.new(:from_array => [[ 6, 6, 6 ], [ 6, 6, 6 ], [ 6, 6, 6 ]])
      matrix_product = matrix_1 * matrix_2
      matrix_product.should == check_product
    end
    
    it "should be able to multiply a number (scalar) times a matrix" do
      matrix = Matrix.new(:from_array => [[ 1, 1 ], [ 2, 2 ], [ 3, 3 ], [ 4, 4 ]])
      scalar = Scalar.new(2)
      check_product = Matrix.new(:from_array => [[ 2, 2 ], [ 4, 4 ], [ 6, 6 ], [ 8, 8 ]])
      scalar_product = scalar * matrix
      scalar_product_swap = matrix * scalar
      scalar_product.should == check_product
      scalar_product_swap.should == check_product
    end
  end
end