require_relative 'test_helper'

module Generator
  class GenerateTestsTest < Minitest::Test
    def test_call
      mock_exercise = Minitest::Mock.new
      mock_exercise.expect :build_tests, nil

      subject = GenerateTests.new(mock_exercise)
      subject.()

      mock_exercise.verify
    end
  end
end
