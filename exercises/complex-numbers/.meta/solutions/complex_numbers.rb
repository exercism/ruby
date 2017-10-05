class ComplexNumber
  attr_accessor :real, :imaginary

  def initialize(values)
    @real = Array(values)[0]
    @imaginary = Array(values)[1] || 0
  end

  def ==(other)
     (self - other).abs.real < 1e-15
  end

  def +(other)
    self.class.new([@real + other.real, @imaginary + other.imaginary])
  end

  def -(other)
    self.class.new([@real - other.real, @imaginary - other.imaginary])
  end

  def *(other)
    self.class.new([@real * other.real - @imaginary * other.imaginary,
         @real * other.imaginary + @imaginary * other.real])
  end

  def /(other)
    self*other.inv
  end

  def abs
    self.class.new(Math.sqrt((self*self.conjugate).real))
  end

  def conjugate
    self.class.new([@real, -@imaginary])
  end

  def inv
   self.class.new([@real / abs.real**2, -@imaginary / abs.real**2])
  end

  def exp
   self.class.new(Math.exp(@real)) * self.class.new([Math.cos(@imaginary), Math.sin(@imaginary)])
  end
end

module BookKeeping
  VERSION = 1
end
