module MatrixTests

  module NewMatrixIdentity
    # @identity_4 = Matrix.new( :identity => 4 )
    # @identity_4.echo
  end
  
  module NewMatrixZero
    # dimensions = { :rows => 5, :cols => 2 }
    # @zero = Matrix.new( :zero => dimensions )
    # @zero.echo
  end
  
  @matrix = Matrix.new( :from_array => [ [  1,  1,  1,  1,  1 ],
                                         [  1,  2,  2,  1,  2 ], 
                                         [  3,  3,  4,  3,  4 ], 
                                         [  4,  5,  6,  4,  5 ] ] )

  # @matrix2 = Matrix.new( :from_array => [ [ 1, 2, 3 ],
                                          # [ 4, 5, 6 ],
                                          # [ 7, 8, 9 ],
                                          # [ 2, 3, 7 ],
                                          # [ 7, 4, 5 ] ] )

  # matrix_product = @matrix.multiply_by_matrix(@matrix2)
  # matrix_product.echo
  
  # @matrix.echo( :type => 'col' )
  
  module MatrixAugment
    # @augment = @matrix.augment([9,9,9,9], { :type => 'row' }, { :type => 'col' } )
    # @augment.echo
  end
  
end

# puts ""
# puts "Matrix::initialize :identity"

# @identity.to_array.each do |row|
  # puts "#{row}"
# end

# puts ""
# puts ""
# puts "Matrix::swap_rows"

# swap = @matrix.swap_rows( 1, 2 )

# swap.to_array.each do |row|
  # print "#{row} \n"
# end

# puts ""
# puts ""
# puts "Matrix::multiply_row"

# multiply = @matrix.multiply_row( 2, 3 )

# multiply.to_array.each do |row|
  # print "#{row} \n"
# end

# puts ""
# puts ""
# puts "Matrix::add_rows"

# add = @matrix.add_rows( 1, 4 )

# add.to_array.each do |row|
  # print "#{row} \n"
# end

# puts ""
# puts ""
# puts "MatrixManipulations::row"

# print @matrix.row(2)

# puts ""
# puts ""
# puts "MatrixManipulations::col"

# print @matrix.col(2)

# puts ""
# puts ""
# puts "MatrixManipulations::ele"

# puts @matrix.ele( 4, 2 )
# puts @matrix.ele( 4, 2, :type => 'col' )

# puts ""
# puts ""
# puts "MatrixManipulations::to_column"

# column = @matrix.to_column

# col_array = column.to_array

# col_array.each do |column|
  # puts "#{column}"
# end

# puts ""
# puts ""
# puts "MatrixOperations::multiply_by_matrix"

# multiply_matrix = @matrix.multiply_by_matrix( @matrix2 )

# multiply_matrix.to_array.each do |row|
  # puts "#{row}"
# end

# puts ""
# puts ""
# puts "MatrixManipulations::augment"

# augment = [ 9, 9, 9, 9, 9 ]

# augmented_matrix = @matrix2.augment( augment )

# augmented_matrix.to_array.each do |row|
  # puts "#{row}"
# end

# puts ""

# aug_col_matrix = @matrix2.augment( augment, :output => 'col' )

# aug_col_matrix.to_array.each do |col|
  # puts "#{col}"
# end

# puts ""
# puts ""
# puts "MatrixManipulations::to_row"

# rowed_matrix = @matrix2.to_row

# rowed_matrix.to_array.each do |row|
  # puts "#{row}"
# end

# puts ""
# puts ""
# puts "MatrixManipulations::dimensions"

# dim_hash = @matrix2.dimensions

# puts dim_hash[:rows]
# puts dim_hash[:cols]