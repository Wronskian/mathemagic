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

require 'matrix_operations'
require 'spec/matrix_printer'

class Matrix
  include MatrixOperations
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

  def multiply_by
    # not yet implemented
  end

end