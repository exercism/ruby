require 'json'
require 'generator/case_values'

module Generator
  # Contains methods accessible to the ERB template
  class TemplateValues
    attr_reader :abbreviated_commit_hash, :exercise_name, :test_cases, :canonical_data_version

    def initialize(abbreviated_commit_hash:, exercise_name:, test_cases:, canonical_data_version: nil)
      @abbreviated_commit_hash = abbreviated_commit_hash
      @exercise_name = exercise_name
      @test_cases = test_cases
      @canonical_data_version = canonical_data_version
    end

    def get_binding
      binding
    end

    def exercise_test_classname
      "#{exercise_name_camel}Test"
    end

    private

    def exercise_name_camel
      exercise_name.split('_').map(&:capitalize).join
    end
  end

  module TemplateValuesFactory
    def template_values
      TemplateValues.new(
        abbreviated_commit_hash: canonical_data.abbreviated_commit_hash,
        canonical_data_version: canonical_data.version,
        exercise_name: exercise.name,
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
      test_case.filename
    end
  end
end
