require_relative '../test_helper'
require 'generator/exercise_case'
require 'generator/case_values'

module Generator
  class ComplexCase < ExerciseCase
    def workload
      assert { Complex.foo(bar) }
    end
  end

  module CaseValues
    class CanonicalTest < Minitest::Test
      def test_works_when_expected_is_not_a_hash
        subject = Canonical.new(expected: 123)
        assert_equal 123, subject.expected
      end

      def test_accessor_by_input_key
        subject = Canonical.new(input: { 'somevalue' => true })
        assert subject.somevalue
      end

      def test_accessor_by_snake_cased_input_key
        subject = Canonical.new(input: { 'someValue' => true })
        assert subject.some_value
      end

      def test_accessor_by_input_prefixed_key
        subject = Canonical.new(input: { 'value' => true })
        assert subject.input_value
      end

      def test_alias_by_input_prefix_and_snake_case
        subject = Canonical.new(input: { 'someValue' => true })
        assert subject.input_some_value
      end

      def test_accessor_by_expected_key
        subject = Canonical.new(expected: { 'value' => true })
        assert subject.value
      end

      def test_accessor_by_snake_cased_expected_key
        subject = Canonical.new(expected: { 'someValue' => true })
        assert subject.some_value
      end

      def test_accessor_by_expected_prefixed_key
        subject = Canonical.new(expected: { 'value' => true })
        assert subject.expected_value
      end

      def test_accessor_by_expected_prefix_and_snake_case
        subject = Canonical.new(expected: { 'someValue' => true })
        assert subject.expected_some_value
      end

      def test_accessor_precedence_input_preferred_to_expected
        subject = Canonical.new(
          input: { 'somevalue' => :input_version },
          expected: { 'somevalue' => :expected_version }
        )
        assert_equal :input_version, subject.somevalue
      end

      def test_respond_to_via_input
        subject = Canonical.new( input: { 'somevalue' => true } )
        assert subject.respond_to?(:somevalue)
      end

      def test_respond_to_via_expected
        subject = Canonical.new( expected: { 'somevalue' => true } )
        assert subject.respond_to?(:somevalue)
      end

      def test_respond_to_via_super
        subject = Canonical.new( expected: { 'somevalue' => true } )
        assert subject.respond_to?(:object_id)
      end
    end

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
