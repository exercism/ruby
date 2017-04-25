require 'exercise_cases'

class BracketPushCase < ExerciseCase

  def workload
    long_input? ? split_test : simple_test
  end

  private

  def long_input?
    input.length > 80
  end

  def simple_test
    "#{assert} Brackets.paired?('#{input}')"
  end

  def split_test
    "str = '#{split_input[0]}'\\
          '#{split_input[1]}'
    #{assert} Brackets.paired?(str)"
  end

  def split_input
    @split_input ||= input.scan(/.{1,#{input.length / 2}}/)
  end
end
