require_relative '../test_helper'

module Generator
  class TemplateValuesTest < Minitest::Test
    def test_metadata
      expected_metadata = TemplateMetadata.new(abbreviated_commit_hash: nil, version: nil, exercise_name: nil)
      subject = TemplateValues.new(metadata: expected_metadata, test_cases: nil)
      assert_equal expected_metadata, subject.metadata
    end

    def test_test_cases
      expected_test_cases = 'should be TemplateValues class'
      subject = TemplateValues.new(metadata: nil, test_cases: expected_test_cases)
      assert_equal expected_test_cases, subject.test_cases
    end

    def test_get_binding
      subject = TemplateValues.new(metadata: nil, test_cases: nil)
      assert_instance_of Binding, subject.get_binding
    end
  end

  class TemplateMetadataTest < Minitest::Test
    def setup
      @arguments = {
        abbreviated_commit_hash: nil, version: nil, exercise_name: nil
      }
    end

    def test_abbreviated_commit_hash
      expected_abbreviated_commit_hash = '1234567'
      subject = TemplateMetadata.new(@arguments.merge(abbreviated_commit_hash: expected_abbreviated_commit_hash))
      assert_equal expected_abbreviated_commit_hash, subject.abbreviated_commit_hash
    end

    def test_version
      expected_version = '1234567'
      subject = TemplateMetadata.new(@arguments.merge(version: expected_version))
      assert_equal expected_version, subject.version
    end

    def test_exercise_name
      expected_exercise_name = 'alpha_beta'
      subject = TemplateMetadata.new(@arguments.merge(exercise_name: 'alpha-beta'))
      assert_equal expected_exercise_name, subject.exercise_name
    end

    def test_exercise_name_camel
      expected_exercise_name_camel = 'AlphaBeta'
      subject = TemplateMetadata.new(@arguments.merge(exercise_name: 'alpha-beta'))
      assert_equal expected_exercise_name_camel, subject.exercise_name_camel
    end
  end

  class TemplateValuesFactoryTest < Minitest::Test
    class TestTemplateValuesFactory
      def exercise_name
        'alpha'
      end

      def version
        2
      end

      def canonical_data
        mock_canonical_data = Minitest::Mock.new
        mock_canonical_data.expect :abbreviated_commit_hash, nil
        mock_canonical_data.expect :to_s, '{"cases":[]}'
        mock_canonical_data
      end

      def paths
        mock_paths = Minitest::Mock.new
        mock_paths.expect :track, 'test/fixtures/xruby'
        mock_paths
      end

      include TemplateValuesFactory
    end

    class ClassBasedTestTemplateValuesFactory
      def exercise_name
        'beta'
      end

      def version
        2
      end

      def canonical_data
        mock_canonical_data = Minitest::Mock.new
        mock_canonical_data.expect :abbreviated_commit_hash, nil
        mock_canonical_data.expect :to_s, '{"cases":[]}'
        mock_canonical_data
      end

      def paths
        mock_paths = Minitest::Mock.new
        mock_paths.expect :track, 'test/fixtures/xruby'
        mock_paths
      end

      include TemplateValuesFactory
    end

    def test_template_values_from_class
      subject = ClassBasedTestTemplateValuesFactory.new
      assert_instance_of TemplateValues, subject.template_values
    end

    def test_template_values_loads_problem_case_classes
      subject = TestTemplateValuesFactory.new
      assert_instance_of TemplateValues, subject.template_values
      assert Object.const_defined?(:AlphaCase)
      assert Object.const_defined?(:AlphaCases)
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
