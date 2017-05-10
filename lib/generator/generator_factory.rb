require 'logger'

module Generator
  class GeneratorFactory
    attr_reader :paths, :exercise_name, :verbose, :freeze

    def initialize(paths:, exercise_name:, verbose: false, freeze: false)
      @paths = paths
      @exercise_name = exercise_name
      @verbose = verbose
      @freeze = freeze
    end

    def build
      generator_class.new(repository)
    end

    private

    def generator_class
      freeze ? GenerateTests : UpdateVersionAndGenerateTests
    end

    def repository
      LoggingRepository.new(
        repository: Repository.new(paths: paths, exercise_name: exercise_name),
        logger: logger
      )
    end

    def logger
      logger = Logger.new($stdout)
      logger.formatter = proc { |_severity, _datetime, _progname, msg| "#{msg}\n" }
      logger.level = verbose ? Logger::DEBUG : Logger::INFO
      logger
    end
  end
end
