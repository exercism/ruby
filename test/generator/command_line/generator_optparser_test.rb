require_relative '../../test_helper'

module Generator
  class GeneratorOptparserTest < Minitest::Test
    FixturePaths = Paths.new(
      metadata: 'test/fixtures/metadata',
      track: 'test/fixtures/ruby'
    )

    def default_options
      {
        freeze: true,
        all: false,
        verbose: false,
        slug: nil
      }
    end

    def test_default_options
      args = %w(beta)
      Files::GeneratorCases.stub :available, %w(beta) do
        assert_equal(
          default_options.merge(slug: 'beta'),
          GeneratorOptparser.new(args, FixturePaths).options
        )
      end
    end

    def test_update_option
      args = %w(-u beta)
      Files::GeneratorCases.stub :available, %w(beta) do
        assert_equal(
          default_options.merge(slug: 'beta', freeze: false),
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
          default_options.merge(slug: 'beta', verbose: true),
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
      'problem-specifications' repository not found.
      Try running the command:
        git clone https://github.com/exercism/problem-specifications.git "test/fixtures/nonexistent"
      MESSAGE
      assert_output nil, /#{expected_stderr}/ do
        refute GeneratorOptparser.new([], paths).options_valid?
      end
    end

    def test_validate_generate_all
      args = ['--all']
      assert GeneratorOptparser.new(args, FixturePaths).options_valid?
    end

    def test_validate_slug
      expected_stderr = 'Exercise name required'
      assert_output(/Usage:/, /#{expected_stderr}/) do
        refute GeneratorOptparser.new([], FixturePaths).options_valid?
      end
    end

    def test_validate_missing_generator
      args = %w(non-existent)
      Files::GeneratorCases.stub :available, [] do
        assert_output(nil, /A generator does not currently exist for non-existent/) do
          refute GeneratorOptparser.new(args, FixturePaths).options_valid?
        end
      end
    end

    def test_missing_generator_tells_you_where_it_looked
      args = %w(non-existent)
      Files::GeneratorCases.stub :available, [] do
        assert_output(nil, %r{exercises/non-existent/\.meta/generator/non_existent_case\.rb}) do
          refute GeneratorOptparser.new(args, FixturePaths).options_valid?
        end
      end
    end
  end
end
