require_relative '../test_helper'

module Generator
  class TestTemplateValuesTest < Minitest::Test
    def setup
      @arguments = {
        exercise: nil, version: nil, canonical_data: nil, test_cases: nil
      }
    end

    def test_abbreviated_commit_hash
      expected_abbreviated_commit_hash = '1234567'
      mock_canonical_data = Minitest::Mock.new.expect :abbreviated_commit_hash, expected_abbreviated_commit_hash
      subject = TemplateValues.new(@arguments.merge(canonical_data: mock_canonical_data))
      assert_equal expected_abbreviated_commit_hash, subject.abbreviated_commit_hash
    end

    def test_canonical_data_version
      expected_canonical_data_version = '0.1.0'
      mock_canonical_data = Minitest::Mock.new.expect :version, expected_canonical_data_version
      subject = TemplateValues.new(@arguments.merge(canonical_data: mock_canonical_data))
      assert_equal expected_canonical_data_version, subject.canonical_data_version
    end

    def test_exercise_name
      expected_exercise_name = 'alpha_beta'
      subject = TemplateValues.new(@arguments.merge(exercise: Exercise.new(slug: 'alpha-beta')))
      assert_equal expected_exercise_name, subject.exercise_name
    end

    def test_exercise_name_camel
      expected_exercise_name_camel = 'AlphaBeta'
      subject = TemplateValues.new(@arguments.merge(exercise: Exercise.new(slug: 'alpha_beta')))
      assert_equal expected_exercise_name_camel, subject.exercise_name_camel
    end

    def test_get_binding
      subject = TemplateValues.new(@arguments)
      assert_instance_of Binding, subject.get_binding
    end
  end

  class TemplateValuesFactoryTest < Minitest::Test
    class TestTemplateValuesFactory
      def exercise
        Exercise.new(slug: 'alpha')
      end

      def version
        2
      end

      def canonical_data
        mock_canonical_data = Minitest::Mock.new
        mock_canonical_data.expect :abbreviated_commit_hash, nil
        mock_canonical_data.expect :version, '1.2.3'
        mock_canonical_data.expect :to_s, '{"cases":[]}'
        mock_canonical_data
      end

      def test_case
        Minitest::Mock.new.expect :filename, 'test/fixtures/xruby/exercises/alpha/.meta/generator/alpha_case.rb'
      end

      include TemplateValuesFactory
    end

    def test_template_values_loads_problem_case_classes
      subject = TestTemplateValuesFactory.new
      assert_instance_of TemplateValues, subject.template_values
      assert Object.const_defined?(:AlphaCase)
    end

    def teardown
      [:AlphaCase, :AlphaCases].each do |classname|
        if Object.const_defined?(classname)
          Object.send(:remove_const, classname)
        end
      end
    end
  end
end
