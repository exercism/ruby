require 'generator/exercise_case'

class MatchingBracketsCase < Generator::ExerciseCase

  def workload
    long_input? ? split_test : simple_test
  end

  private

  def long_input?
    value.length > 80
  end

  def simple_test
    assert_or_refute(expected,  "Brackets.paired?('#{value}')")
  end

  def split_test
    [
      "string = '#{split_input[0]}' +\n",
      "         '#{split_input[1]}'\n",
      assert_or_refute(expected,  "Brackets.paired?(string)")
    ].join
  end

  def split_input
    value.scan(/.{1,#{value.length / 2}}/)
  end
end
