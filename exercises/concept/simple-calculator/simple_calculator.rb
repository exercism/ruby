class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  def self.calculate(first_operand, second_operand, operation)
    raise NotImplementedError, 'Please implement the SimpleCalculator.calculate method'
  end
end
