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
# INTEGER CLASS
#
# methods for dealing with integers of the form [integer]
#
#------------------------------------------------------------------------------
#
# Implementation Progress:
#
# [ ] creation
# [ ] multiplication
# [ ] division
# [ ] addtion
# [ ] subtraction
#
#------------------------------------------------------------------------------

class MagicInt
  
  def initialize(integer)
    @integer = [ integer ]
  end
  
  def value
    @integer[0]
  end
  
  def gcd(other)
    case
      when self.value < other.value
        big = other.value
        lil = self.value
      when self.value > other.value
        big = self.value
        lil = other.value
      when self.value == other.value
        "GCD is undefined for equal values"
    end
    #NYI
  end
  
end