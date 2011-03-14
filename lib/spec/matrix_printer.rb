#==============================================================================
#
# MATRIX PRINT OUTPUT for the COMMAND LINE
#
#------------------------------------------------------------------------------

module MatrixPrinter

  def echo ( input = { :type => 'row' } )
    if input[:type] == 'col'        # if input is a column matrix, turn it into
      row_matrix = self.to_row      # a row matrix before printing matrix
      @matrix = row_matrix.to_array
    end  
    @matrix.each do |row|           # finds the biggest number in the matrix
      @max_digits = 1
      row.each do |element|
        num = element.to_s
        digits = []
        num.each_char do |digit|
          digits << digit
        end
        digit_count = digits.count
        if digit_count > @max_digits
          @max_digits = digit_count
        end
      end
    end    
    @matrix.each do |row|      # prints matrix. one row per line in brackets.
      print "["      
      row.each_index do |i|
        element = row[i]
        element_count = row.count
        num = element.to_s            # spaces elements into columns
        digits = []
        num.each_char do |digit|
          digits << digit
        end
        digit_count = digits.count
        extra_spaces = @max_digits - digit_count
        (0..extra_spaces).each do |s|
          print " "
        end
        print element
        unless i == element_count - 1
          print ","
        end
      end
      print " ] \n"
    end
  end
end