require 'exercise_cases'

class HammingCase < ExerciseCase
  def workload
    if raises_error?
      assert_raises(ArgumentError) { test_case }
    else
      assert_equal { test_case }
    end
  end

  private

  def test_case
    "Hamming.compute('#{strand1}', '#{strand2}')"
  end
end

HammingCases = proc do |data|
  JSON.parse(data)['cases'].map.with_index do |row, i|
    HammingCase.new(row.merge('index' => i))
  end
end
