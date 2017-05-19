require 'logger'

module Generator
  class CommandLine
    def initialize(paths)
      @paths = paths
    end

    def parse(args)
      parser = GeneratorOptparser.new(args, paths)
      @options = parser.options
      generators if parser.options_valid?
    end

    private
    attr_reader :paths

    def generators
      implementations.map { |slug| generator(implementation(exercise(slug))) }
    end

    def implementations
      @options[:all] ? Files::GeneratorCases.available(paths.track) : [@options[:slug]]
    end

    def generator(implementation)
      generator_class.new(implementation)
    end

    def generator_class
      freeze? ? GenerateTests : UpdateVersionAndGenerateTests
    end

    def freeze?
      @options[:freeze] || @options[:all]
    end

    def exercise(slug)
      Exercise.new(slug: slug)
    end

    def implementation(exercise)
      LoggingImplementation.new(
        implementation: Implementation.new(exercise: exercise, repository: repository),
        logger: logger
      )
    end

    # do we need one per implementation, or could they all use the same one?
    def repository
      Repository.new(paths: paths)
    end

    # do we need one per implementation, or could they all use the same one?
    def logger
      logger = Logger.new($stdout)
      logger.formatter = proc { |_severity, _datetime, _progname, msg| "#{msg}\n" }
      logger.level = @options[:verbose] ? Logger::DEBUG : Logger::INFO
      logger
    end
  end
end
