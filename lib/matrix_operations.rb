#==============================================================================
#
# mathemagic
# by Ryan Dalke
#
# v 0.0.0 pre-alpha aka CORNDOG
#
# March 2011
# MIT License
#
#------------------------------------------------------------------------------

#==============================================================================
#
# MATRIX OPERATIONS
#
# Implementation Progress:
#
# [x] matrix multiplication            -- method multiply_by_matrix ( matrix )
#
#------------------------------------------------------------------------------

require 'matrix_manipulations'

module MatrixOperations
  include MatrixManipulations

# multiply a matrix by another matrix. requires MxP & PxN dimension matricies
# assumes row matricies

  def multiply_by_matrix ( m )  
    number_of_columns = self.dimension[:cols]
    number_of_rows = m.dimension[:rows]    
    new_matrix = []    
    if number_of_columns == number_of_rows    
      @column_matrix = m.to_column    
      @matrix.each_index do |i|
        selected_row = row( i + 1 )
        @new_row = []        
        @column_matrix.to_array.each do |column|
          selected_column = column          
          sum = 0
          selected_row.each_index do |j|
            product = selected_row[j] * selected_column[j]
            @result = product + sum
            sum = @result
          end          
          @new_row << @result
        end        
        new_matrix << @new_row
      end        
      Matrix.new( :from_array => new_matrix )
    else    
      puts "ERROR - MISMATCHED DIMENSIONS"
      puts "Requires MxP & PxN dimension matricies"      
      empty_matrix = []
      Matrix.new( :from_array => empty_matrix )
    end
  end
  
#------------------------------------------------------------------------------

end