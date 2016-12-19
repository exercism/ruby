require_relative 'test_helper'

class WordyCaseTest < Minitest::Test
  def test_test_name
    test_case = WordyCase.new(description: 'description')

    assert_equal 'test_description', test_case.test_name
  end

  def test_test_name_with_description_with_spaces
    test_case = WordyCase.new(description: 'description with spaces')

    assert_equal 'test_description_with_spaces', test_case.test_name
  end

  def test_skipped_with_zero_index
    test_case = WordyCase.new(index: 0)

    assert_equal '# skip', test_case.skipped
  end

  def test_skipped_with_non_zero_index
    test_case = WordyCase.new(index: 1)

    assert_equal 'skip', test_case.skipped
  end

  def test_workload_with_expected_and_no_message
    test_case = WordyCase.new(expected: 1, input: 1)

    expected_workload = [
      'question = \'1\'',
      '    assert_equal(1, WordProblem.new(question).answer)',
    ].join("\n")

    assert_equal expected_workload, test_case.workload
  end

  def test_workload_with_expected_and_message
    test_case = WordyCase.new(expected: 1, input: 1, message: 'test %s')

    expected_workload = [
      'question = \'1\'',
      '    answer = WordProblem.new(question).answer',
      '    message = "test #{answer}"',
      '    assert_equal(1, answer, message)',
    ].join("\n")

    assert_equal expected_workload, test_case.workload
  end

  def test_workload_without_expected
    test_case = WordyCase.new(input: 1)

    expected_workload = [
      'question = \'1\'',
      '    assert_raises ArgumentError do',
      '      WordProblem.new(question).answer',
      '    end',
    ].join("\n")

    assert_equal expected_workload, test_case.workload
  end
end

class WordyCasePrProcessorTest < Minitest::Test
  def test_call_as_non_special_case
    row = { 'input' => '' }
    processed_row = WordyCase::PreProcessor.call(row)

    assert_equal({ 'input' => '', 'message' => nil }, processed_row)
  end

  def test_call_as_special_case
    row = { 'input' => 'What is -3 plus 7 multiplied by -2?' }
    processed_row = WordyCase::PreProcessor.call(row)
    expected_row = {
      'input' => 'What is -3 plus 7 multiplied by -2?',
      'message' => 'You should ignore order of precedence. -3 + 7 * -2 = -8, not %s',
    }

    assert_equal expected_row, processed_row
  end
end

class WordyCasesTest < Minitest::Test
  def test_call
    json = {
      cases: [
        { description: 'test 1' },
        { description: 'test 2' },
      ]
    }.to_json

    expected_cases = [
      WordyCase.new(description: 'test 1', message: nil, index: 0),
      WordyCase.new(description: 'test 2', message: nil, index: 1),
    ]

    assert_equal expected_cases, WordyCases.call(json)
  end
end
