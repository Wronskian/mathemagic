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
#
# MATRIX
#
# Defines methods for dealing with matricies in the form:
#
# M = [ [ a, b, c, ... ], 
#       [ d, e, f, ... ],
#       .              .
#       .              .
#       .              .
#       [ ..., x, y, z ] ]
#       
# Each inner array represents either a row or a column of a matrix.
# By default, matricies should be in the form of a row matrix.
#
# The word column is often shortened to just "col" in many situations.
#
# row_matrix = [ [row_array], [row_array], ... [row_array] ]
# col_matrix = [ [col_array], [col_array], ... [col_array] ]
#
#------------------------------------------------------------------------------
#
# Implementation Progress: 
#     (more below for different sections)
#
# [x] swap rows                    -- method swap_rows( r1, r2 )
# [x] multiply row by a scalar     -- method multiply_row( r, number )
# [x] add two rows                 -- method add_rows ( r1, r2 )
# [ ] determinant
# [ ] scalar multiplication
# [ ] build matrix
#     [x] from array               -- :from_array => matrix_array
#     [x] identity matrix          -- :identity => #
#     [x] zero matrix              -- :zero => { :rows => #, :cols = # }
#                                  
#
#------------------------------------------------------------------------------

require 'operations'

require 'spec/matrix_printer'

class Matrix
  include Operations

  include MatrixPrinter

  def initialize ( options = { :from_array => [] } )  
    case    
      when options[:from_array].nil? == false
        new_matrix = options[:from_array]
        @matrix = new_matrix      
      when options[:identity].nil? == false
        new_matrix = []
        size = options[:identity]
        (1..size).each do |r|
          new_row = []
          (1..size).each do |c|
            if c == r
              new_row << 1
            else
              new_row << 0
            end
          end
          new_matrix << new_row
        end
        @matrix = new_matrix        
      when options[:zero].nil? == false
        new_matrix = []
        rows = options[:zero][:rows]
        cols = options[:zero][:cols]
        (1..rows).each do |r|
          new_row = []
          (1..cols).each do |c|
            new_row << 0
          end
          new_matrix << new_row
        end
        @matrix = new_matrix        
      else
        @matrix = new_matrix_array
    end    
  end

#==============================================================================
#
# ELEMENTARY ROW OPERATIONS
# 
#------------------------------------------------------------------------------

# swap one row with another

  def swap_rows ( r1, r2 )
    new_matrix = []    
    @matrix.each do |r|
      case
        when r == row(r1)
          new_matrix << row(r2)
        when r == row(r2)
          new_matrix << row(r1)
        else
          new_matrix << r
      end
    end    
    Matrix.new( new_matrix )
  end
  
#------------------------------------------------------------------------------
  
# mulitply a row's elements by a number
  
  def multiply_row ( r, number )
    new_row = []    
    row(r).each do |element|
      new_row << element * number
    end    
    new_matrix = []    
    @matrix.each do |row|
      if row == row(r)
        new_matrix << new_row
      else
        new_matrix << row
      end
    end    
    Matrix.new( new_matrix )
  end
  
#------------------------------------------------------------------------------
  
# adds row to another row, and places in the latter. r1 + r2 = r2
  
  def add_rows ( r1, r2 )
    new_matrix = []  
    @matrix.each do |row|    
      if row == row(r2)
        new_row = []        
        row(r2).each_index do |i|
          c = i + 1
          new_row << ele( r2, c ) + ele( r1, c )
        end
        new_matrix << new_row
      else
        new_matrix << row
      end
    end    
    Matrix.new( new_matrix )
  end
  
#------------------------------------------------------------------------------

#==============================================================================
#
# DETERMINANT
#
#------------------------------------------------------------------------------

  def det
    # not yet implemented
  end
  
#==============================================================================
#
# SCALAR MULTIPLICATION
#
#------------------------------------------------------------------------------

  def multiply_by_number (number, options = { :type => 'row' })
    if options[:type] == 'col'
      @matrix = self.to_row
    end
  
    new_matrix = []
    @matrix.each_index do |i|
      r = i + 1
      new_matrix << self.multiply_row(r, number)
    end
    new_matrix
  end

#==============================================================================
#
# MATRIX OPERATIONS
#
# Implementation Progress:
#
# [x] matrix multiplication            -- method multiply_by_matrix ( matrix )
#
#------------------------------------------------------------------------------  
#
# MULTIPLY BY MATRIX
#  
# multiply a matrix by another matrix. requires MxP & PxN dimension matricies
# assumes row matricies
#
#------------------------------------------------------------------------------

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

#==============================================================================
#
# MATRIX MANIPULATIONS
#
# Implementation Progress:
#
# [x] get matrix row from matrix array     -- method row( row )
# [x] get matrix column from matrix array  -- method col( column )
# [x] get matrix element from matrix array -- method ele( row, column )
# [x] make column matrix from row matrix   -- method to_column
# [x] make row matrix from column matrix   -- method to_row
# [x] augment matrix                       -- method augment ( column_array )
# [x] convert a matrix to an array         -- method to_array
# [x] get the dimensions of a matrix       -- method dimension
# 
#------------------------------------------------------------------------------
    
# get row from matrix array
# can specifiy column matrix by passing :type => 'col', default is row matrix.
# outputs row as an array of values [ a, b, c, ... ]

  def row ( row, input = { :type => 'row' } )
    case
      when input[:type] == 'row'
        @matrix[ row - 1 ]        
      when input[:type] == 'col'
        new_row = []        
        @matrix.each do |column|
          row_element = column[ row - 1 ]
          new_row << row_element
        end      
        new_row
    end
  end
  
#------------------------------------------------------------------------------

# get column from matrix array
# can specifiy column matrix by passing :type => 'col', default is row matrix.
# outputs column as an array of values [ a, b, c, ... ]

  def col ( column, input = { :type => 'row' } )
    case
      when input[:type] == 'row'
        new_column = []        
        @matrix.each do |row|
          column_element = row[ column - 1 ]
          new_column << column_element
        end
        new_column        
      when input[:type] == 'col'
        @matrix[ column - 1 ]        
    end
  end

#------------------------------------------------------------------------------
  
# get element from matrix array
# can specifiy column matrix by passing :type => 'col', default is row matrix.
# outputs a value

  def ele ( row, column, input = { :type => 'row' } )
    case
      when input[:type] == 'row'
        @matrix[ row - 1 ][ column - 1 ]        
      when input[:type] == 'col'
        @matrix[ column - 1 ][ row - 1 ]        
    end
  end
  
#------------------------------------------------------------------------------

# turn the arrays of a matrix from rows into columns
# outputs a column matrix [[column], [column], ... ]

  def to_column
    col_matrix = []    
    col_count = row(1).count    
    (1..col_count).each do |c|
      col_matrix << col(c)
    end    
    Matrix.new( :from_array => col_matrix )
  end
  
#------------------------------------------------------------------------------
  
# turn the arrays of a matrix from columns to rows
# outputs a row matrix [[row], [row], ... ]

  def to_row ( input = { :type => 'col' } )
    row_matrix = []      
    row_count = col( 1, input ).count    
    (1..row_count).each do |r|
      row_matrix << row( r, input )
    end    
    Matrix.new( :from_array => row_matrix )
  end

#------------------------------------------------------------------------------

# builds an array out of a matrix

  def to_array
    new_array = []    
    @matrix.each do |array|
      new_array << array
    end    
    new_array
  end

#------------------------------------------------------------------------------

# gets the dimensions of a matrix
# outputs a hash of dimensions { :rows => #, :cols => # }

  def dimension ( input = { :type => 'row' } )
    case
      when input[:type] == 'row'
        rows = @matrix.count
        columns = @matrix[0].count
        { :rows => rows, :cols => columns }        
      when input[:type] == 'col'
        columns = @matrix.count
        rows = @matrix[0].count
        { :rows => rows, :cols => columns }
    end
  end

#------------------------------------------------------------------------------

# augment a matrix
# outputs an augmented row matrix or column matrix (default is row)

  def augment ( augment, input = { :type => 'row' }, output = { :type => 'row' } )
    case
      when input[:type] == 'col'
        row_matrix = self.to_row
      when input[:type] == 'row'
        row_matrix = self
    end
    num_rows = row_matrix.dimension[:rows]
    num_aug_rows = augment.count
    if num_rows == num_aug_rows
      col_matrix = row_matrix.to_column
      array = col_matrix.to_array << augment
      new_matrix = Matrix.new( :from_array => array )
      case
        when output[:type] == 'col'
          new_matrix
        when output[:type] == 'row'
          new_matrix.to_row
      end
    else
      puts "ERROR - DIMENSION MISMATCH"
      puts "Augment requires the augment to have the same number of elements
            as there are rows in the matrix"
      empty_matrix = []
      Matrix.new( :from_array => empty_matrix )
    end
  end
  
#------------------------------------------------------------------------------

end