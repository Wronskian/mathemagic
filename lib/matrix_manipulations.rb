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

module MatrixManipulations
    
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