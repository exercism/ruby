require_relative '../test_helper'

module Generator
  class CommandLineTest < Minitest::Test
    FixturePaths = Paths.new(
      metadata: 'test/fixtures/metadata',
      track: 'test/fixtures/xruby'
    )

    def test_default_options
      args = %w(beta)
      Files::GeneratorCases.stub :available, %w(beta) do
        assert_instance_of(
          UpdateVersionAndGenerateTests,
          CommandLine.new(FixturePaths).parse(args)
        )
      end
    end

    def test_frozen_option
      args = %w(-f beta)
      Files::GeneratorCases.stub :available, %w(beta) do
        assert_instance_of(
          GenerateTests,
          CommandLine.new(FixturePaths).parse(args)
        )
      end
    end

    def test_all_option
      args = %w(-a)
      fake_generators = %w(some fake generator names also-hyphen-ated)
      Files::GeneratorCases.stub :available, fake_generators do
        assert_instance_of(
          GenerateAllTests,
          CommandLine.new(FixturePaths).parse(args)
        )
      end
    end

    def test_verbose_option
      args = %w(-v beta)
      Files::GeneratorCases.stub :available, %w(beta) do
        assert_instance_of(
          UpdateVersionAndGenerateTests,
          CommandLine.new(FixturePaths).parse(args)
        )
      end
    end
  end
end
