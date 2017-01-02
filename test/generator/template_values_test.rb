require_relative '../test_helper'

module Generator
  class TestCasesValuesTest < Minitest::Test
    def test_sha1
      expected_sha1 = '1234567'
      subject = TemplateValues.new(sha1: expected_sha1, version: nil, test_cases: nil)
      assert_equal expected_sha1, subject.sha1
    end

    def test_version
      expected_version = '1234567'
      subject = TemplateValues.new(version: expected_version, sha1: nil, test_cases: nil)
      assert_equal expected_version, subject.version
    end

    def test_test_cases
      expected_test_cases = 'should be TemplateValues class'
      subject = TemplateValues.new(test_cases: expected_test_cases, sha1: nil, version: nil)
      assert_equal expected_test_cases, subject.test_cases
    end

    def test_get_binding
      subject = TemplateValues.new(sha1: nil,version: nil, test_cases: nil)
      assert_instance_of Binding, subject.get_binding
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

      include TemplateValuesFactory
    end

    def test_template_values
      $LOAD_PATH.unshift 'test/fixtures/xruby/lib'
      subject = TestTemplateValuesFactory.new
      assert_instance_of TemplateValues, subject.template_values
    end

    def teardown
      $LOAD_PATH.delete 'test/fixtures/xruby/lib'
    end
  end
end
