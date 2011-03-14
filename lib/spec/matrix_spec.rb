require './matrix'

describe "Matrix" do

  context "creating a new matrix" do
  
    size_limit = 10
  
    it "should be able to create an identity matrix of arbitrary size" do
      dimension = 1 + rand(size_limit)
      identity_matrix = Matrix.new(:identity => dimension)
      identity_matrix.to_array.each_index do |i|
        r = i + 1
        row = identity_matrix.row(r)
        row.each_index do |k|
          c = k + 1
          case
            when r == c
              row[k].should == 1
            when r != c
              row[k].should == 0
          end
        end
      end
    end
    
    it "should be able to create a zero matrix of arbitrary size" do
      rows = 1 + rand(size_limit)
      cols = 1 + rand(size_limit)
      dimensions = { :rows => rows, :cols => cols }
      zero_matrix = Matrix.new(:zero => dimensions)
      zero_matrix.to_array.each do |row|
        sum = row.inject{ |sum, n| sum + n }
        sum.should == 0
      end
    end
  end
  
  context "matrix manipulations" do
  
    row_1 = [ 1, 1, 1, 1, 1 ]
    row_2 = [ 2, 2, 2, 2, 2 ]
    row_3 = [ 3, 4, 5, 6, 7 ]
    row_4 = [ 4, 4, 4, 4, 4 ]
    array = [ row_1, row_2, row_3, row_4 ]
    matrix = Matrix.new(:from_array => array)
    
    col_1 = [ 1, 2, 3, 4 ]
    col_2 = [ 1, 2, 4, 4 ]
    col_3 = [ 1, 2, 5, 4 ]
    col_4 = [ 1, 2, 6, 4 ]
    col_5 = [ 1, 2, 7, 4 ]
    col_array = [ col_1, col_2, col_3, col_4, col_5 ]
    col_check_matrix = Matrix.new(:from_array => col_array)
    
    context "row method" do
    
      it "should be able to get an arbitrary row from a row matrix (default)" do
        matrix.to_array.each_index do |i|
          r = i + 1
          check_row = matrix.to_array[i]
          matrix.row(r).should == check_row
        end
      end
      
      it "should be able to get an arbitrary row from a column matrix" do
        col_matrix = matrix.to_column
        matrix.to_array.each_index do |i|
          r = i + 1
          check_row = matrix.to_array[i]
          col_matrix.row(r, :type => 'col').should == check_row
        end
      end
    end
    
    context "col method" do
    
      it "should be able to get an arbitrary column from a row matrix (default)" do
        col_matrix = matrix.to_column
        col_matrix.to_array.each_index do |k|
          c = k + 1
          check_col = col_matrix.to_array[k]
          matrix.col(c).should == check_col
        end
      end
      
      it "should be able to get an arbitrary column from a column matrix" do
        col_matrix = matrix.to_column
        col_matrix.to_array.each_index do |k|
          c = k + 1
          check_col = col_matrix.to_array[k]
          col_matrix.col(c, :type => 'col').should == check_col
        end
      end
    end

    context "ele method" do
    
      it "should be able to get an arbitrary element from a row matrix (default)" do
        matrix.to_array.each_index do |i|
          r = i + 1
          row = matrix.row(r)
          row.each_index do |e|
            c = e + 1
            element = row[e]
            matrix.ele(r,c).should == element
          end
        end
      end
      
      it "should be able to get an arbitrary element from a column matrix" do
        col_matrix = matrix.to_column
        matrix.to_array.each_index do |i|
          r = i + 1
          row = matrix.row(r)
          row.each_index do |e|
            c = e + 1
            element = row[e]
            col_matrix.ele(r,c, :type => 'col').should == element
          end
        end
      end
    end
    
    context "to_column method" do
      it "should be able to turn a row matrix into a column matrix" do
        col_matrix = matrix.to_column
        col_matrix.to_array.each_index do |k|
          c = k + 1
          col_matrix.col(c, :type => 'col') == col_check_matrix.col(c, :type => 'col')
        end
      end
    end
    
    context "to_row method" do
      it "should be able to turn a column matrix into a row matrix" do
        #NYI
      end
    end
    
    context "to_array method" do
      it "should convert a matrix object into an array object" do
        #NYI
      end
    end
    
    context "dimension method" do
      it "should return a hash of the matrix's dimensions" do
        #NYI
      end
    end
    
    context "augment method" do
      it "should augment a column onto a row matrix with an equal number of rows" do
        #NYI
      end
      
      it "should augment a column onto a col matrix with an equal number of rows" do
        #NYI
      end
      
      it "should return an error if the augmented col is not equal to the number of rows" do
        #NYI
      end
    end
  end
  
  context "matrix operations" do
    context "multiply_by_matrix method" do
      it "should multiply an MxP matrix by a PxN matrix to return a MxN matrix" do
        #NYI
      end
      
      it "should get the correct answer" do
        #NYI
      end
    end
  end  
end