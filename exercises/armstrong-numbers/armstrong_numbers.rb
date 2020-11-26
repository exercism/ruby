class ArmstrongNumbers
  def self.include?(numbers)
    numbers.digits.sum {|number| number ** numbers.digits.length } == numbers
  end
end
