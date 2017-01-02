require_relative 'test_helper'

class GrainsTest < Minitest::Test
  def test_test_name
    test_case = GrainsCase.new(description: 'description')

    assert_equal 'test_description', test_case.test_name
  end

  def test_test_name_when_description_has_spaces
    test_case = GrainsCase.new(description: 'description with spaces')

    assert_equal 'test_description_with_spaces', test_case.test_name
  end

  def test_workload_is_not_implemented
    assert_raises(NotImplementedError) { GrainsCase.new.workload }
  end

  def test_skipped_with_zero_index
    assert_equal '# skip', GrainsCase.new(index: 0).skipped
  end

  def test_skipped_with_non_zero_index
    assert_equal 'skip', GrainsCase.new(index: 1).skipped
  end
end

class SquareMethodTest < Minitest::Test
  def test_workload_when_expected_is_negative
    test_case = GrainsCase::SquareMethod.new(expected: -1, input: 10)

    assert_equal 'assert_raises(ArgumentError) { Grains.square(10) }',
                 test_case.workload
  end

  def test_workload_when_expected_is_positive
    test_case = GrainsCase::SquareMethod.new(expected: 1, input: 10)

    assert_equal 'assert_equal 1, Grains.square(10)', test_case.workload
  end

  def test_workload_with_large_expected_number
    test_case = GrainsCase::SquareMethod.new(expected: 10000, input: 10)

    assert_equal 'assert_equal 10_000, Grains.square(10)', test_case.workload
  end
end

class TotalMethodTest < Minitest::Test
  def test_workload
    test_case = GrainsCase::TotalMethod.new(expected: 1)

    assert_equal 'assert_equal 1, Grains.total', test_case.workload
  end

  def test_workload_with_large_expected_number
    test_case = GrainsCase::TotalMethod.new(expected: 10000)

    assert_equal 'assert_equal 10_000, Grains.total', test_case.workload
  end
end

class GrainsCasesTest < Minitest::Test
  def test_handling_of_json
    json = {
      square: {
        cases: [
          {},
          {},
        ],
      },
      total: {
      }
    }.to_json

    cases = GrainsCases.call(json)

    assert_instance_of GrainsCase::SquareMethod, cases[0]
    assert_instance_of GrainsCase::SquareMethod, cases[1]
    assert_instance_of GrainsCase::TotalMethod, cases[2]
  end

  def test_continuous_index
    json = {
      square: {
        cases: [
          {},
          {},
        ],
      },
      total: {
      }
    }.to_json

    cases = GrainsCases.call(json)

    assert_equal 0, cases[0].index
    assert_equal 1, cases[1].index
    assert_equal 2, cases[2].index
  end
end
