class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '-', '/', '*']

  # TODO: Show how to define custom exceptions
  # TODO: Explain why custom errors are subclasses of StandardError
  # TODO: Explain why is not a good idea to rescue from Exception
  UnsupportedOperation = Class.new(StandardError)

  def self.calculate(first_operand, second_operand, operation)
    raise NotImplementedError, 'Please implement the SimpleCalculator.calculate method'
  end
end
