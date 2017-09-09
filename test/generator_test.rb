require_relative 'test_helper'

module Generator
  class UpdateVersionAndGenerateTestsTest < Minitest::Test
    def test_call
      mock_exercise = Minitest::Mock.new
      mock_exercise.expect :update_tests_version, nil
      mock_exercise.expect :update_example_solution, nil
      mock_exercise.expect :build_tests, nil
      mock_exercise.expect :build_readme, nil

      subject = UpdateVersionAndGenerateTests.new(mock_exercise)
      subject.call

      mock_exercise.verify
    end
  end

  class UpdateVersionAndGenerateTestsFrozenVersionTest < Minitest::Test
    def test_call
      mock_exercise = Minitest::Mock.new
      mock_exercise.expect :build_tests, nil
      mock_exercise.expect :build_readme, nil

      subject = GenerateTests.new(mock_exercise)
      subject.call

      mock_exercise.verify
    end
  end

end
