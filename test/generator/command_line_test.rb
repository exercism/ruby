require_relative '../test_helper'

module Generator
  class CommandLineTest < Minitest::Test
    FixturePaths = Paths.new(
      metadata: 'test/fixtures/metadata',
      track: 'test/fixtures/xruby'
    )

    def test_parse
      expected_stderr = 'Exercise name required'
      assert_output(/Usage:/, /#{expected_stderr}/) do
        refute CommandLine.new(FixturePaths).parse([])
      end
    end

    def test_invalid_metadata_repository_outputs_message_to_stderr
      paths = Paths.new(metadata: 'test/fixtures/nonexistent', track: nil)
      expected_stderr = <<-MESSAGE.gsub(/^ {6}/,'')
      'x-common' repository not found.
      Try running the command:
        git clone https://github.com/exercism/x-common.git "test/fixtures/nonexistent"
      MESSAGE
      assert_output nil, /#{expected_stderr}/ do
        refute CommandLine.new(paths).parse([])
      end
    end

    def test_usage_help
      args = %w(-h)
      assert_output(/Usage:/, nil) do
        refute CommandLine.new(FixturePaths).parse(args)
      end
    end

    def test_usage_help_with_exercise
      args = %w(-h isogram)
      assert_output(/Usage:/, nil) do
        refute CommandLine.new(FixturePaths).parse(args)
      end
    end

    def test_usage_help_includes_available_generators
      args = %w(-h)
      fake_generators = %w(some fake generator names also-hyphen-ated)
      Files::GeneratorCases.stub :available, fake_generators do
        assert_output(/#{fake_generators.sort.join(' ')}/, nil) do
          refute CommandLine.new(FixturePaths).parse(args)
        end
      end
    end

    def test_validate_missing_generator
      args = %w(nonexistent)
      Files::GeneratorCases.stub :available, [] do
        assert_output(nil, /A generator does not currently exist fo/) do
          refute CommandLine.new(FixturePaths).parse(args)
        end
      end
    end

    def test_default_options
      args = %w(isogram)
      Files::GeneratorCases.stub :available, %w(isogram) do
        assert_instance_of UpdateVersionAndGenerateTests, CommandLine.new(FixturePaths).parse(args)
      end
    end

    def test_frozen_option
      args = %w(-f isogram)
      Files::GeneratorCases.stub :available, %w(isogram) do
        assert_instance_of GenerateTests, CommandLine.new(FixturePaths).parse(args)
      end
    end

    def test_verbose_option
      args = %w(-v isogram)
      Files::GeneratorCases.stub :available, %w(isogram) do
        assert_instance_of UpdateVersionAndGenerateTests, CommandLine.new(FixturePaths).parse(args)
      end
    end
  end
end
