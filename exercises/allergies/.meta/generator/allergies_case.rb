require 'generator/exercise_case'

class AllergiesCase < Generator::ExerciseCase
  def workload
    assertions = list_expected? ? list_assertion : individual_assertions
    allergies_declaration = "allergies = Allergies.new(#{score})"
    indent_lines(assertions.unshift(allergies_declaration), 4)
  end

  def list_expected?
    property == 'list'
  end

  def list_assertion
    ["assert_equal %w(#{expected.join(' ')}), allergies.list"]
  end

  def individual_assertions
    expected.map do |assertion|
      substance = assertion['substance']
      result = assertion['result']
      "#{result ? assert(substance) : refute(substance)}"
    end
  end

  def refute(allergen)
    "refute allergies.allergic_to?('#{allergen}')"
  end

  def assert(allergen)
    "assert allergies.allergic_to?('#{allergen}')"
  end
end
