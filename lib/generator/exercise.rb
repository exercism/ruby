require 'delegate'
require 'forwardable'

module Generator
  class Exercise
    include TemplateValuesFactory
    extend Forwardable

    def initialize(repository:)
      @repository = repository
    end
    attr_reader :repository
    def_delegators :@repository, :tests_version, :example_solution, :minitest_tests, :tests_template, :canonical_data

    def version
      tests_version.to_i
    end

    def update_tests_version
      tests_version.increment
    end

    def update_example_solution
      example_solution.update_version(version)
    end

    def build_tests
      minitest_tests.generate(
        template: tests_template.to_s,
        values: template_values
      )
    end
  end

  # This exists to give us a clue as to what we are delegating to.
  class ExerciseDelegator < SimpleDelegator
  end

  # A exercise that also logs its progress.
  class LoggingExercise < ExerciseDelegator
    def initialize(exercise:, logger:)
      __setobj__ @exercise = exercise
      @logger = logger
    end

    def update_tests_version
      @exercise.update_tests_version
      @logger.debug "Incremented tests version to #{version}"
    end

    def update_example_solution
      @exercise.update_example_solution
      @logger.debug "Updated version in example solution to #{version}"
    end

    def build_tests
      @exercise.build_tests
      @logger.info "Generated #{repository.slug} tests version #{version}"
    end
  end
end
