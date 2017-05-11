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
      exercises.map do |slug|
        generator(repository(slug))
      end
    end

    def exercises
      @options[:all] ? Files::GeneratorCases.available(paths.track) :
        [@options[:slug]]
    end

    def generator(repository)
      generator_class.new(repository)
    end

    def generator_class
      freeze? ? GenerateTests : UpdateVersionAndGenerateTests
    end

    def freeze?
      @options[:freeze] || @options[:all]
    end

    def repository(slug)
      LoggingRepository.new(
        repository: Repository.new(paths: paths, exercise_name: slug),
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
