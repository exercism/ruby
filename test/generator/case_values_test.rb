require_relative '../test_helper'

class ComplexCase < ExerciseCase
  def workload
    assert { Complex.foo(bar) }
  end
end

module Generator
  module CaseValues
    class ExtractorTest < Minitest::Test
      def test_not_implemented_error
        assert_raises NotImplementedError do
          Extractor.extract(exercise_name: nil, exercise_data: nil)
        end
      end
    end

    class AutoExtractorTest < Minitest::Test
      def test_multi_level_auto_extraction
        cases = AutoExtractor.new(
          exercise_name: 'complex',
          exercise_data: File.read('test/fixtures/metadata/exercises/complex/canonical-data.json')
        ).extract

        expected = [
          ComplexCase.new(description: 'first generic verse', property: 'verse', number: 99,
                          expected: '99 bottles of beer on the wall, YAAAR', index: 0),
          ComplexCase.new(description: 'last generic verse', property: 'verse', number: 3,
                          expected: '3 bottles of beer on the wall, YAAAR', index: 1),
          ComplexCase.new(description: 'first two verses', property: 'verses', beginning: 99, end: 98,
                          expected: "99 bottles of beer on the wall, YAR, PIRATES CAN'T COUNT", index: 2)
        ]
        assert_equal expected, cases
      end
    end

    class ProcExtractorTest < Minitest::Test
      def test_extract_via_proc
        require_relative '../fixtures/xruby/lib/alpha_cases.rb'
        cases = ProcExtractor.new(
          exercise_name: 'alpha',
          exercise_data: File.read('test/fixtures/metadata/exercises/alpha/canonical-data.json')
        ).extract
        expected = [AlphaCase.new(description: 'add 2 numbers', input: [1, 1], expected: 2, index: 0)]
        assert_equal expected, cases
      end
    end
  end
end
