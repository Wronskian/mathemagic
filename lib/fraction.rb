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
# FRACTION CLASS
#
# methods for dealing with fraction objects that are in the form:
# fraction = [ numerator, denominator ]
#
#------------------------------------------------------------------------------
#
# Implementation Progress:
#
# [ ] new fraction
# [ ] convert to a decimal
# [ ] reduce
# [ ] add
# [ ] subtract
# [ ] multiply
#     [x] fraction * fraction
#     [x] fraction * integer
# [ ] divide
# [ ] lowest common denominator
#
#------------------------------------------------------------------------------

class Fraction

  attr_accessor :numerator, :denominator
  
  def initialize(numerator, denominator)
    @numerator = numerator
    @denominator = denominator
  end
  
  def *(other)
    case
      when other.class == Fraction
       product_numerator = self.numerator * other.numerator
       product_denominator = self.denominator * other.denominator
       product = Fraction.new(product_numerator, product_denominator)
       product
       
     when other.class == MagicInt
      product_numerator = self.numerator * other.value
      product = Fraction.new(product_numerator, self.denominator)
      product
      
     else
       "Mulitipliction of that type is not defined for a fraction"
    end
  end
  
  def ==(other)
    case
      when other.class == Fraction
        if self.numerator == other.numerator && self.denominator == other.denominator
          true
        else
          false
        end
    end
  end
  
end