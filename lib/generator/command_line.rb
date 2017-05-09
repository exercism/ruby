require 'logger'

module Generator
  # Processes the command line arguments and sets everthing up and returns a
  # generator that can be called
  class CommandLine
    def initialize(paths)
      @paths = paths
    end

    def parse(args)
      parser = GeneratorOptparser.new(args, @paths)
      @options = parser.options
      generator if parser.options_valid?
    end

    private

    def generator
      generator_class.new(repository)
    end

    def generator_class
      @options[:freeze] ? GenerateTests : UpdateVersionAndGenerateTests
    end

    def repository
      LoggingRepository.new(
        repository: Repository.new(paths: @paths, exercise_name: @options[:exercise_name]),
        logger: logger
      )
    end

    def logger
      logger = Logger.new($stdout)
      logger.formatter = proc { |_severity, _datetime, _progname, msg| "#{msg}\n" }
      logger.level = @options[:verbose] ? Logger::DEBUG : Logger::INFO
      logger
    end
  end
end
