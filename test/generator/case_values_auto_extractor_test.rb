require_relative '../test_helper'

module Generator
  module CaseValues
    class AutoExtractorTest < Minitest::Test
      def setup
        $LOAD_PATH.unshift 'test/fixtures/xruby/lib'
      end

      def test_simple_auto_extraction
        require Files::GeneratorCases.filename('gamma')
        cases = AutoExtractor.new(
          exercise_name: 'gamma', exercise_data: simple_canonical_data.to_s
        ).extract
        expected = [GammaCase.new(description: 'add 2 numbers', input: [1, 1], expected: 2, index: 0)]
        assert_equal expected.to_s, cases.to_s
      end

      def test_multi_level_auto_extraction
        require Files::GeneratorCases.filename('gamma')
        cases = AutoExtractor.new(
          exercise_name: 'gamma', exercise_data: complex_canonical_data.to_s
        ).extract

        expected = [
          GammaCase.new(description: 'first generic verse', property: 'verse', number: 99,
                        expected: '99 bottles of beer on the wall, YAAAR', index: 0),
          GammaCase.new(description: 'last generic verse', property: 'verse', number: 3,
                        expected: '3 bottles of beer on the wall, YAAAR', index: 1),
          GammaCase.new(description: 'first two verses', property: 'verses', beginning: 99, end: 98,
                        expected: "99 bottles of beer on the wall, YAR, PIRATES CAN'T COUNT", index: 2)
        ]
        assert_equal expected.to_s, cases.to_s
      end

      def teardown
        $LOAD_PATH.delete 'test/fixtures/xruby/lib'
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
    end
  end
end
