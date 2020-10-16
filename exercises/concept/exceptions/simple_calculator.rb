class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*']

  UnsupportedOperation = Class.new(StandardError)

  def self.calculate(first_operand, second_operand, operation)
    raise NotImplementedError, 'Please implement the SimpleCalculator.calculate method'
  end
end
