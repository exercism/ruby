require_relative '../test_helper'

module Generator
  module CaseValues
    class ProcExtractorTest < Minitest::Test

      def setup
        $LOAD_PATH.unshift 'test/fixtures/xruby/lib'
      end

      def test_extract_via_proc
        cases = ProcExtractor.new(
          exercise_name: 'alpha',
          exercise_data: simple_canonical_data.to_s
        ).extract
        expected = [AlphaCase.new(description: 'add 2 numbers', input: [1, 1], expected: 2, index: 0)]
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

    end
  end
end
