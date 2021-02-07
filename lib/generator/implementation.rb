require 'delegate'
require 'forwardable'
require 'generator/template_values'

module Generator
  class Implementation
    extend Forwardable
    include TemplateValuesFactory

    def_delegators :@repository, :example_solution, :tests_template, :minitest_tests, :canonical_data, :test_case

    def initialize(repository:, exercise:)
      @repository = repository
      @exercise = exercise
    end

    attr_reader :repository, :exercise

    def slug
      exercise.slug
    end

    def build_tests
      minitest_tests.generate(
        template: tests_template.to_s,
        values: template_values
      )
    end
  end

  # This exists to give us a clue as to what we are delegating to.
  class ImplementationDelegator < SimpleDelegator
  end

  # A implementation that also logs its progress.
  class LoggingImplementation < ImplementationDelegator
    def initialize(implementation:, logger:)
      super

      __setobj__ @implementation = implementation
      @logger = logger
    end

    def build_tests
      @implementation.build_tests
      @logger.info "Generated #{exercise.slug} tests"
    end
  end
end
