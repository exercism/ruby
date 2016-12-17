require_relative 'test_helper'

module Generator
  class UpdateVersionAndGenerateTestsTest < Minitest::Test
    def test_call
      mock_repository = Minitest::Mock.new
      mock_repository.expect :update_tests_version, nil
      mock_repository.expect :update_example_solution, nil
      mock_repository.expect :create_tests_file, nil

      subject = UpdateVersionAndGenerateTests.new(mock_repository)
      subject.call

      mock_repository.verify
    end
  end

  class UpdateVersionAndGenerateTestsFrozenVersionTest < Minitest::Test
    def test_call
      mock_repository = Minitest::Mock.new
      mock_repository.expect :create_tests_file, nil

      subject = GenerateTests.new(mock_repository)
      subject.call

      mock_repository.verify
    end
  end

end
