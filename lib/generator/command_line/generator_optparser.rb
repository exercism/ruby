require 'optparse'

module Generator
  class GeneratorOptparser
    DEFAULT_OPTIONS = {
      freeze: true,
      all: false,
      verbose: false,
      slug: nil
    }.freeze

    attr_reader :options

    def initialize(args, paths)
      @args = args
      @paths = paths
      @options = parse_options
    end

    def options_valid?
      validate_paths && validate_options &&
        (options[:all] || (validate_exercise && validate_cases))
    end

    private

    def parse_options
      @options = DEFAULT_OPTIONS.dup
      option_parser.parse!(@args)
      options.tap { |opts| opts[:slug] = @args.shift unless opts[:all] }
    end

    def option_parser
      @option_parser ||= OptionParser.new do |parser|
        parser.banner = "Usage: #{$PROGRAM_NAME} [options] exercise-generator"
        parser.on('-u', '--update', 'Update test version') { |value| options[:freeze] = !value }
        parser.on('-a', '--all', 'Regenerate all available test suites (does not update version)') do |value|
          options[:all] = value
        end
        parser.on('-h', '--help', 'Displays this help message') { |value| options[:help] = value }
        parser.on('-v', '--verbose', 'Display progress messages') { |value| options[:verbose] = value }
      end
    end

    def usage
      option_parser.help <<
        "\nAvailable exercise generators:\n" <<
        available_generators.sort.join(' ')
    end

    def available_generators
      Files::GeneratorCases.available(@paths.track)
    end

    def validate_paths
      return true if File.directory?(@paths.metadata)
      $stderr.puts metadata_repository_missing_message(@paths.metadata)
      false
    end

    def metadata_repository_missing_message(repository)
      <<-EOM.gsub(/^ {6}/, '')

      'problem-specifications' repository not found.
      Try running the command:
        git clone https://github.com/exercism/problem-specifications.git "#{repository}"

      EOM
    end

    def validate_options
      return true unless options[:help]
      $stdout.puts usage
      false
    end

    def validate_exercise
      return true if options[:slug]
      $stderr.puts "Exercise name required!\n"
      $stdout.puts usage
      false
    end

    def validate_cases
      return true if available_generators.include?(options[:slug])
      warning = "A generator does not currently exist for #{options[:slug]}!"
      expected_location = "Expecting it to be at: #{Files::GeneratorCases.source_filepath(@paths.track, options[:slug])}"
      $stderr.puts [warning, expected_location].join("\n")
      false
    end
  end
end
