require_relative '../test_helper'

module Generator
  class TestTemplateValuesTest < Minitest::Test
    def test_abbreviated_commit_hash
      expected_abbreviated_commit_hash = '1234567'
      subject = TemplateValues.new(abbreviated_commit_hash: expected_abbreviated_commit_hash,
                                   exercise_name: nil,
                                   test_cases: nil)
      assert_equal expected_abbreviated_commit_hash, subject.abbreviated_commit_hash
    end

    def test_exercise_name
      expected_exercise_name = 'alpha_beta'
      subject = TemplateValues.new(abbreviated_commit_hash: nil,
                                   exercise_name: expected_exercise_name,
                                   test_cases: nil)
      assert_equal expected_exercise_name, subject.exercise_name
    end

    def test_exercise_test_classname
      expected = 'AlphaBetaTest'
      subject = TemplateValues.new(abbreviated_commit_hash: nil,
                                   test_cases: nil,
                                   exercise_name: 'alpha_beta')
      assert_equal expected, subject.exercise_test_classname
    end

    def test_test_cases
      expected_test_cases = 'should be TemplateValues class'
      subject = TemplateValues.new(abbreviated_commit_hash: nil,
                                   exercise_name: nil,
                                   test_cases: expected_test_cases)
      assert_equal expected_test_cases, subject.test_cases
    end

    def test_get_binding
      subject = TemplateValues.new(abbreviated_commit_hash: nil,
                                   exercise_name: nil,
                                   test_cases: nil)
      assert_instance_of Binding, subject.get_binding
    end
  end

  class TemplateValuesFactoryTest < Minitest::Test
    class TestTemplateValuesFactory
      def exercise
        Exercise.new(slug: 'alpha')
      end

      def canonical_data
        mock_canonical_data = Minitest::Mock.new
        mock_canonical_data.expect :abbreviated_commit_hash, nil
        mock_canonical_data.expect :version, '1.2.3'
        mock_canonical_data.expect :to_s, '{"cases":[]}'
        mock_canonical_data
      end

      def test_case
        Files::TestCaseFile.new(filename: 'test/fixtures/ruby/exercises/alpha/.meta/generator/alpha_case.rb')
      end

      include TemplateValuesFactory
    end

    def test_template_values_loads_problem_case_classes
      subject = TestTemplateValuesFactory.new
      assert_instance_of TemplateValues, subject.template_values
      assert Object.const_defined?(:AlphaCase)
    end

    def teardown
      %i[AlphaCase AlphaCases].each do |classname|
        Object.send(:remove_const, classname) if Object.const_defined?(classname)
      end
    end
  end
end
