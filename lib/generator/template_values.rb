module Generator
  # Contains methods accessible to the ERB template
  class TemplateValues
    using Underscore

    attr_reader :exercise, :version, :canonical_data, :test_cases

    def initialize(exercise:, version:, canonical_data:, test_cases:)
      @exercise = exercise
      @version = version
      @canonical_data = canonical_data
      @test_cases = test_cases
    end

    def get_binding
      binding
    end

    def abbreviated_commit_hash
      canonical_data.abbreviated_commit_hash
    end

    def canonical_data_version
      canonical_data.version
    end

    def exercise_name
      exercise.name
    end

    def exercise_name_camel
      exercise.name.camel_case
    end
  end

  module TemplateValuesFactory
    def template_values
      TemplateValues.new(
        exercise: exercise,
        version: version,
        canonical_data: canonical_data,
        test_cases: extract
      )
    end

    private

    def extract
      load cases_load_name
      extractor.cases(canonical_data.to_s)
    end

    def extractor
      CaseValues::Extractor.new(
        case_class: Object.const_get(exercise.case_class)
      )
    end

    def cases_load_name
      Files::GeneratorCases.source_filepath(paths.track, exercise.slug)
    end
  end
end
