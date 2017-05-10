module Generator
  # Processes the command line arguments and sets everthing up and returns a
  # generator that can be called
  class CommandLine
    def initialize(paths)
      @paths = paths
    end

    def parse(args)
      parser = GeneratorOptparser.new(args, paths)
      @options = parser.options
      generate if parser.options_valid?
    end

    private
    attr_reader :paths

    def generate
      return GenerateAllTests.new(paths: paths, verbose: @options[:verbose]) if @options[:all]

      GeneratorFactory.new(
        paths: paths,
        exercise_name: @options[:exercise_name],
        verbose: @options[:verbose],
        freeze: @options[:freeze]
      ).build
    end
  end
end
