require_relative '../test_helper'

module Generator
  class TestCasesValuesTest < Minitest::Test
    def test_abbreviated_commit_hash
      expected_abbreviated_commit_hash = '1234567'
      subject = TemplateValues.new(abbreviated_commit_hash: expected_abbreviated_commit_hash, version: nil, test_cases: nil)
      assert_equal expected_abbreviated_commit_hash, subject.abbreviated_commit_hash
    end

    def test_version
      expected_version = '1234567'
      subject = TemplateValues.new(version: expected_version, abbreviated_commit_hash: nil, test_cases: nil)
      assert_equal expected_version, subject.version
    end

    def test_test_cases
      expected_test_cases = 'should be TemplateValues class'
      subject = TemplateValues.new(test_cases: expected_test_cases, abbreviated_commit_hash: nil, version: nil)
      assert_equal expected_test_cases, subject.test_cases
    end

    def test_get_binding
      subject = TemplateValues.new(abbreviated_commit_hash: nil, version: nil, test_cases: nil)
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

  class CaseValuesTest < Minitest::Test
    def setup
      $LOAD_PATH.unshift 'test/fixtures/xruby/lib'
    end

    def simple_canonical_data
      simple_canonical_data = Minitest::Mock.new
      simple_canonical_data.expect(
        :to_s,
        <<-TEXT
{
	"description": "Test canonical data",
	"cases": [
	{
		"description": "add 2 numbers",
		"input": [1,1],
		"expected": 2
	}
	]
}
TEXT
      )
      simple_canonical_data
    end

    def complex_canonical_data
      complex_canonical_data = Minitest::Mock.new
      complex_canonical_data.expect(
        :to_s,
        <<-TEXT
{
  "exercise": "beer-song",
  "version": "1.0.0",
  "cases": [
    {
      "description": "verse",
      "cases": [
        {
          "description": "single verse",
          "cases": [
            {
              "description": "first generic verse",
              "property": "verse",
              "number": 99,
              "expected": "99 bottles of beer on the wall, YAAAR"
            },
            {
              "description": "last generic verse",
              "property": "verse",
              "number": 3,
              "expected": "3 bottles of beer on the wall, YAAAR"
            }
          ]
        }
      ]
    },
    {
      "description": "lyrics",
      "cases": [
        {
          "description": "multiple verses",
          "cases": [
            {
              "description": "first two verses",
              "property": "verses",
              "beginning": 99,
              "end": 98,
              "expected": "99 bottles of beer on the wall, YAR, PIRATES CAN'T COUNT"
            }
          ]
        }
      ]
    }
  ]
}
TEXT
      )
      complex_canonical_data
    end

    def test_extract_via_proc
      cases = CaseValues.extract(exercise_name: 'alpha', exercise_data: simple_canonical_data.to_s)
      expected = [AlphaCase.new(description: 'add 2 numbers', input: [1, 1], expected: 2, index: 0)]
      assert_equal expected.to_s, cases.to_s
    end

    def test_simple_auto_extraction
      cases = CaseValues.extract(exercise_name: 'gamma', exercise_data: simple_canonical_data.to_s)
      expected = [GammaCase.new(description: 'add 2 numbers', input: [1, 1], expected: 2, index: 0)]
      assert_equal expected.to_s, cases.to_s
    end

    def test_multi_level_auto_extraction
      cases = CaseValues.extract(exercise_name: 'gamma', exercise_data: complex_canonical_data.to_s)
      expected = [
        GammaCase.new(description: 'first generic verse', property: 'verse', number: 99,
                      expected: '99 bottles of beer on the wall, YAAAR', index: 0),
        GammaCase.new(description: 'last generic verse', property: 'verse', number: 3,
                      expected: '3 bottles of beer on the wall, YAAAR', index: 1),
        GammaCase.new(description: 'first two verses', property: 'verses', beginning: 99, end: 98,
                      expected: "99 bottles of beer on the wall, YAR, PIRATES CAN'T COUNT", index: 2),

      ]
      assert_equal expected.to_s, cases.to_s
    end

    def teardown
      $LOAD_PATH.delete 'test/fixtures/xruby/lib'
    end
  end
end
