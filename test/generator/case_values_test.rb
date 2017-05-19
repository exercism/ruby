require_relative '../test_helper'

module Generator
  class ComplexCase < ExerciseCase
    def workload
      assert { Complex.foo(bar) }
    end
  end

  module CaseValues
    class ExtractorTest < Minitest::Test
      def test_multi_level_auto_extraction
        canonical_data = File.read('test/fixtures/metadata/exercises/complex/canonical-data.json')
        cases = Extractor.new(
          case_class: ComplexCase,
        ).cases(canonical_data)

        expected = [
          ComplexCase.new(
            canonical: {
              'description' => 'first generic verse',
              'property' => 'verse',
              'number' => 99,
              'expected' => '99 bottles of beer on the wall, YAAAR'
            }
          ),
          ComplexCase.new(
            canonical: {
              'description' => 'last generic verse',
              'property' => 'verse',
              'number' => 3,
              'expected' => '3 bottles of beer on the wall, YAAAR'
            }
          ),
          ComplexCase.new(
            canonical: {
              'description' => 'first two verses',
              'property' => 'verses',
              'beginning' => 99,
              'end' => 98,
              'expected' => "99 bottles of beer on the wall, YAR, PIRATES CAN'T COUNT"
            }
          )
        ]
        assert expected.zip(cases).all? do |exp, cs|
          assert_equal exp.canonical, cs.canonical
        end
      end
    end
  end
end
