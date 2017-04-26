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
      TemplateValues.new(
        abbreviated_commit_hash: canonical_data.abbreviated_commit_hash,
        version: version,
        test_cases: extract
      )
    end

    private

    def extract
      load cases_load_name
      extractor.call(canonical_data.to_s)
    end

    def extractor
        CaseValues::Extractor.new(
          case_class: Object.const_get(Files::GeneratorCases.class_name(exercise_name))
        )
    end

    def cases_load_name
      Files::GeneratorCases.load_filename(paths.track, exercise_name)
    end
  end
end
