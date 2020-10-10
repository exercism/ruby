class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '-', '/', '*']

  UnsupportedOperation = Class.new(StandardError)

  def self.calculate(first_operand, second_operand, operation)
    raise ArgumentError.new unless (first_operand.is_a?(Integer) && second_operand.is_a?(Integer))
    raise UnsupportedOperation.new unless ALLOWED_OPERATIONS.include?(operation)

    result = first_operand.to_i.public_send(operation, second_operand.to_i)

    "#{first_operand} #{operation} #{second_operand} = #{result}"
  rescue ZeroDivisionError
    'Division by zero is not allowed.'
  end
end
