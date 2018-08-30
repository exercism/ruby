require 'generator/exercise_case'

class SieveCase < Generator::ExerciseCase
  ARRAY_ELEMENTS_PER_ROW = 17.freeze

  def workload
    [
      formatted_expected,
      "assert_equal expected, Sieve.new(#{limit}).primes"
    ]
  end

  private

  def formatted_expected
    return "expected = #{expected}" unless needs_indentation?

    array_rows = expected.each_slice(ARRAY_ELEMENTS_PER_ROW).map { |elements| elements.join(', ') }
    [
      "expected = [\n",
      indent_by(2,array_rows.join(",\n")) + "\n",
      "]\n"
    ].join
  end

  def needs_indentation?
    expected.size > ARRAY_ELEMENTS_PER_ROW
  end
end
