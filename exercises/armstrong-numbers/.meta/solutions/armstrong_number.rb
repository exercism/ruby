class ArmstrongNumber
  def self.is_valid?(number)
    digits = number.to_s.split('').map(&:to_i)
    exponent = digits.size

    digits.reduce(0) do |acc, digit|
      digit**exponent + acc
    end == number
  end
end
