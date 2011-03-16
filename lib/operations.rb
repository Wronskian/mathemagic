module Operations

  def *(second)
    first_class = self.class
    second_class = second.class
    
    case
      when first_class == Matrix && second_class == Matrix
        self.multiply_by_matrix(second)
      
      when first_class == Scalar && second_class == Matrix
        second.multiply_by_number(self)
        
      when first_class == Matrix && second_class == Scalar
        self.multiply_by_number(second)
        
      when first_class == Scalar && second_class == Scalar
    end
  end
  
  def ==(second)
    first_class = self.class
    second_class = second.class
    
    case
      when first_class == Matrix && second_class == Matrix
        if self.to_array == second.to_array
          return true
        else
          return false
        end
    end
  end
end