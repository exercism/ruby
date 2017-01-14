module Generator
  # Contains methods accessible to the ERB template
  class TemplateValues
    attr_reader :abbreviated_commit_hash, :version, :test_cases

    def initialize(abbreviated_commit_hash:, version:, test_cases:)
      @abbreviated_commit_hash = abbreviated_commit_hash
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

      TemplateValues.new(
        abbreviated_commit_hash: canonical_data.abbreviated_commit_hash,
        version: version,
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
