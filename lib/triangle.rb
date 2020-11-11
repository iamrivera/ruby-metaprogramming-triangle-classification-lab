class Triangle

  def initialize(a,b,c)
    @side_a = a 
    @side_b = b 
    @side_c = c 
  end

  def kind
    #Tests sides greater than zero  
    non_zero = @side_a > 0 && @side_b > 0 && @side_c > 0 

    #Tests triangle inequality principle met 
    triangle_inequality = @side_a + @side_b > @side_c && @side_a + @side_c > @side_b && @side_b + @side_c > @side_a

    #Tests triangle validity (expect True if conditions met)
    valid = non_zero && triangle_inequality

    #Outputs triangle kind with error message 
    if !valid
      raise TriangleError
    elsif valid  && @side_a != @side_b && @side_a != @side_c && @side_b != @side_c
        :scalene
    elsif valid && @side_a == @side_b && @side_b == @side_c
        :equilateral
    elsif valid && @side_a == @side_b || @side_a == @side_c || @side_b == @side_c 
        :isosceles
    end
  end


  class TriangleError < StandardError
  end

end
