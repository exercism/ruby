require_relative '../../test_helper'

module Generator
  class GeneratorOptparserTest < Minitest::Test
    FixturePaths = Paths.new(
      metadata: 'test/fixtures/metadata',
      track: 'test/fixtures/xruby'
    )

    def default_options
      {
        freeze: false,
        all: false,
        verbose: false,
        exercise_name: nil
      }
    end

    def test_default_options
      args = %w(beta)
      Files::GeneratorCases.stub :available, %w(beta) do
        assert_equal(
          default_options.merge(exercise_name: 'beta'),
          GeneratorOptparser.new(args, FixturePaths).options
        )
      end
    end

    def test_frozen_option
      args = %w(-f beta)
      Files::GeneratorCases.stub :available, %w(beta) do
        assert_equal(
          default_options.merge(exercise_name: 'beta', freeze: true),
          GeneratorOptparser.new(args, FixturePaths).options
        )
      end
    end

    def test_all_option
      args = %w(-a)
      assert_equal(
        default_options.merge(all: true),
        GeneratorOptparser.new(args, FixturePaths).options
      )
    end

    def test_help_option
      args = %w(-h)
      assert_equal(
        default_options.merge(help: true),
        GeneratorOptparser.new(args, FixturePaths).options
      )
    end

    def test_verbose_option
      args = %w(-v beta)
      Files::GeneratorCases.stub :available, %w(beta) do
        assert_equal(
          default_options.merge(exercise_name: 'beta', verbose: true),
          GeneratorOptparser.new(args, FixturePaths).options
        )
      end
    end

    def test_usage_help
      args = %w(-h)
      assert_output(/Usage:/, nil) do
        refute GeneratorOptparser.new(args, FixturePaths).options_valid?
      end
    end

    def test_usage_help_with_exercise
      args = %w(-h beta)
      assert_output(/Usage:/, nil) do
        refute GeneratorOptparser.new(args, FixturePaths).options_valid?
      end
    end

    def test_usage_help_includes_available_generators
      args = %w(-h)
      fake_generators = %w(some fake generator names also-hyphen-ated)
      Files::GeneratorCases.stub :available, fake_generators do
        assert_output(/#{fake_generators.sort.join(' ')}/, nil) do
          refute GeneratorOptparser.new(args, FixturePaths).options_valid?
        end
      end
    end

    def test_invalid_metadata_repository_outputs_message_to_stderr
      paths = Paths.new(metadata: 'test/fixtures/nonexistent', track: nil)
      expected_stderr = <<-MESSAGE.gsub(/^ {6}/, '')
      'x-common' repository not found.
      Try running the command:
        git clone https://github.com/exercism/x-common.git "test/fixtures/nonexistent"
      MESSAGE
      assert_output nil, /#{expected_stderr}/ do
        refute GeneratorOptparser.new([], paths).options_valid?
      end
    end

    def test_validate_generate_all
      args = ['--all']
      assert GeneratorOptparser.new(args, FixturePaths).options_valid?
    end

    def test_validate_exercise_name
      expected_stderr = 'Exercise name required'
      assert_output(/Usage:/, /#{expected_stderr}/) do
        refute GeneratorOptparser.new([], FixturePaths).options_valid?
      end
    end

    def test_validate_missing_generator
      args = %w(nonexistent)
      Files::GeneratorCases.stub :available, [] do
        assert_output(nil, /A generator does not currently exist fo/) do
          refute GeneratorOptparser.new(args, FixturePaths).options_valid?
        end
      end
    end
  end
end
