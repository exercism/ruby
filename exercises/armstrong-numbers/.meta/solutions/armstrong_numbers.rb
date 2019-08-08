class ArmstrongNumbers
  def self.include?(number)
    exponent = number.digits.size

    number.digits.sum { |digit| digit**exponent } == number
  end
end
