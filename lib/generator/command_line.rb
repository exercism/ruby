require 'logger'
require 'optparse'

module Generator
  # Processes the command line arguments and sets everthing up and returns a
  # generator that can be called
  class CommandLine
    def initialize(paths)
      @paths = paths
      @options = default_options
    end

    def parse(args)
      parse_options(args)
      generator if valid?
    end

    private

    def valid?
      validate_paths && validate_options && validate_exercise && validate_cases
    end

    def generator
      generator_class.new(repository)
    end

    def generator_class
      @options[:freeze] ? GenerateTests : UpdateVersionAndGenerateTests
    end

    def repository
      if @options[:quiet]
        Repository.new(paths: @paths, exercise_name: @options[:exercise_name])
      else
        LoggingRepository.new(paths: @paths, exercise_name: @options[:exercise_name], logger: logger)
      end
    end

    def parse_options(args)
      args = args.dup
      option_parser.parse!(args)
      @options[:exercise_name] = args.shift
    end

    def logger
      logger = Logger.new($stdout)
      logger.formatter = proc { |_severity, _datetime, _progname, msg| "#{msg}\n" }
      logger.level = @options[:quiet] ? Logger::ERROR : Logger::DEBUG
      logger
    end

    def default_options
      {
        freeze: false,
        quiet: false,
        exercise_name: nil
      }
    end

    def validate_options
      return true unless @options[:help]
      $stdout.puts usage
      false
    end

    def validate_paths
      validate_metadata_repository
    end

    def validate_exercise
      return true if @options[:exercise_name]
      $stderr.puts "Exercise name required!\n"
      $stdout.puts usage
      false
    end

    def validate_cases
      return true if available_generators.include?(@options[:exercise_name])
      $stderr.puts "A generator does not currently exist for #{@options[:exercise_name]}!"
      false
    end

    def available_generators
      Files::GeneratorCases.available(@paths.track)
    end

    def option_parser
      @option_parser ||= OptionParser.new do |parser|
        parser.banner = "Usage: #{$PROGRAM_NAME} [options] exercise-generator"
        parser.on('-f', '--freeze', 'Don\'t update test version') { |value| @options[:freeze] = value }
        parser.on('-h', '--help', 'Displays this help message') { |value| @options[:help] = value }
        parser.on('-q', '--quiet', "Don't display progress messages") { |value| @options[:quiet] = value }
      end
    end

    def usage
      option_parser.help <<
        "\nAvailable exercise generators:\n" <<
        available_generators.sort.join(' ')
    end

    def validate_metadata_repository
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
  end
end
