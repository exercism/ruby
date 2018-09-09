require 'generator/exercise_case'

class AllergiesCase < Generator::ExerciseCase
  def workload
    [
      "allergies = Allergies.new(#{score})\n",
       assertions
    ].join
  end

  def assertions
    case property
    when 'list' then list_assertion
    when 'allergicTo' then substance_assertions
    end
  end

  def list_assertion
    [
      "expected_items = #{expected.sort.inspect}\n",
      "assert_equal expected_items, allergies.list.sort\n"
    ]
  end

  def substance_assertions
    expected.map do |test|
      "#{assert_or_refute(test['result'])} allergies.allergic_to?('#{test['substance']}')\n"
    end
  end

  def assert_or_refute(status)
    status ? 'assert' : 'refute'
  end
end
