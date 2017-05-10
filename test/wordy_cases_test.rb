require 'json'
require_relative 'test_helper'
require_relative '../exercises/wordy/.meta/generator/wordy_cases'

class WordyCaseTest < Minitest::Test
  def test_workload_with_expected_and_no_message
    test_case = WordyCase.new(case_data: {'expected' => 1, 'input' => 1})

    expected_workload = [
      'question = \'1\'',
      '    assert_equal(1, WordProblem.new(question).answer)',
    ].join("\n")

    assert_equal expected_workload, test_case.workload
  end

  def test_workload_with_expected_and_message
    test_case = WordyCase.new(
      case_data: {'expected' => 1, 'input' => 'What is -3 plus 7 multiplied by -2?'}
    )
    message = test_case.send(:message)

    expected_workload = [
      "question = 'What is -3 plus 7 multiplied by -2?'",
      '    answer = WordProblem.new(question).answer',
      '    message = "' + message[0..-3] + '#{answer}"',
      '    assert_equal(1, answer, message)',
    ].join("\n")

    assert_equal expected_workload, test_case.workload
  end

  def test_workload_without_expected
    test_case = WordyCase.new(case_data: {'input' => 1})

    expected_workload = [
      'question = \'1\'',
      '    assert_raises ArgumentError do',
      '      WordProblem.new(question).answer',
      '    end',
    ].join("\n")

    assert_equal expected_workload, test_case.workload
  end
end
