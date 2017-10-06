class ComplexNumber
  attr_reader :real, :imaginary

  def initialize(real, imaginary = 0)
    @real = real
    @imaginary = imaginary
  end

  def ==(other)
     (self - other).abs < 1e-15
  end

  def +(other)
    self.class.new(@real + other.real, @imaginary + other.imaginary)
  end

  def -(other)
    self.class.new(@real - other.real, @imaginary - other.imaginary)
  end

  def *(other)
    self.class.new(@real * other.real - @imaginary * other.imaginary,
         @real * other.imaginary + @imaginary * other.real)
  end

  def /(other)
    self*other.inv
  end

  def abs
    Math.sqrt((self*self.conjugate).real)
  end

  def conjugate
    self.class.new(@real, -@imaginary)
  end

  def inv
   self.class.new(@real / abs**2, -@imaginary / abs**2)
  end

  def exp
   self.class.new(Math.exp(@real)) * self.class.new(Math.cos(@imaginary), Math.sin(@imaginary))
  end
end

module BookKeeping
  VERSION = 1
end
