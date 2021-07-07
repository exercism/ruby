class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  def self.calculate(first_operand, second_operand, operation)
    raise NoMethodError, 'Please implement the SimpleCalculator.calculate method'
  end
end
