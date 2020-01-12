require 'generator/exercise_case'

class BinarySearchCase < Generator::ExerciseCase
  def workload
    [binary_search, assertion].join
  end

  private

  def binary_search
    "binary = BinarySearch.new(#{array})\n"
  end

  def assertion
    expected.is_a?(Numeric) ? standard_assertion : error_assertion
  end

  def standard_assertion
    "assert_equal #{expected}, binary.search_for(#{value})"
  end

  def error_assertion
    assert_equal(nil, "binary.search_for(#{value})")
  end
end
