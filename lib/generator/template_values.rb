module Generator
  # Contains methods accessible to the ERB template
  class TemplateValues
    attr_reader :sha1, :version, :test_cases

    def initialize(sha1:, version:, test_cases:)
      @sha1 = sha1
      @version = version
      @test_cases = test_cases
    end

    def get_binding
      binding
    end
  end

  module TemplateValuesFactory
    def template_values
      # These are needed by the 'ExerciseCases' classes
      # TODO: move these into the individual classes
      require 'ostruct'
      require 'json'
      require cases_require_name

      # Compensate for the version.next that appears in template files.
      # TODO: remove the .next from the template files and remove compensation
      compensated_version = version - 1

      TemplateValues.new(
        # TODO: rename sha1 to abbreviated_commit_hash
        sha1: canonical_data.abbreviated_commit_hash,
        version: compensated_version,
        test_cases: test_cases_proc.call(canonical_data.to_s)
      )
    end

    private

    def cases_require_name
      Files::GeneratorCases.filename(exercise_name)
    end

    def test_cases_proc
      Object.const_get(Files::GeneratorCases.proc_name(exercise_name))
    end
  end
end
