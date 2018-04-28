require 'logger'
require 'generator/command_line/generator_optparser'
require 'generator/exercise'
require 'generator/repository'

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
      implementations.map { |slug| generator(implementation(slug)) }
    end

    def implementations
      @options[:all] ? Files::GeneratorCases.available(paths.track) : [@options[:slug]]
    end

    def generator(implementation)
      generator_class.new(implementation)
    end

    def generator_class
      update? ? UpdateVersionAndGenerateTests : GenerateTests
    end

    def update?
      @options[:update]
    end

    def implementation(slug)
      exercise = Exercise.new(slug: slug)
      repository = Repository.new(paths: paths, slug: slug)
      LoggingImplementation.new(
        implementation: Implementation.new(repository: repository, exercise: exercise),
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
