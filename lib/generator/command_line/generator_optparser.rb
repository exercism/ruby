require 'optparse'

module Generator
  class GeneratorOptparser
    attr_reader :options

    def initialize(args, paths)
      @args = args
      @paths = paths
      @options = parse_options
    end

    def options_valid?
      validate_paths && validate_options && validate_exercise && validate_cases
    end

    private

    def parse_options
      @options = default_options
      option_parser.parse!(@args)
      options.tap { |opts| opts[:exercise_name] = @args.shift }
    end

    def default_options
      {
        freeze: false,
        verbose: false,
        exercise_name: nil
      }
    end

    def option_parser
      @option_parser ||= OptionParser.new do |parser|
        parser.banner = "Usage: #{$PROGRAM_NAME} [options] exercise-generator"
        parser.on('-f', '--freeze', 'Don\'t update test version') { |value| options[:freeze] = value }
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

      'x-common' repository not found.
      Try running the command:
        git clone https://github.com/exercism/x-common.git "#{repository}"

      EOM
    end

    def validate_options
      return true unless options[:help]
      $stdout.puts usage
      false
    end

    def validate_exercise
      return true if options[:exercise_name]
      $stderr.puts "Exercise name required!\n"
      $stdout.puts usage
      false
    end

    def validate_cases
      return true if available_generators.include?(options[:exercise_name])
      $stderr.puts "A generator does not currently exist for #{options[:exercise_name]}!"
      false
    end
  end
end
