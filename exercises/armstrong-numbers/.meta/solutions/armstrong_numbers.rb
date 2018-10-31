class ArmstrongNumbers
  def self.is_valid?(number)
    exponent = number.digits.size

    number.digits.sum { |digit| digit**exponent } == number
  end
end
