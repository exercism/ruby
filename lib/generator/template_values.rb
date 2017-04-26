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
      require cases_require_name

      TemplateValues.new(
        abbreviated_commit_hash: canonical_data.abbreviated_commit_hash,
        version: version,
        test_cases: extract
      )
    end

    private

    def extract
      extractor.extract(
        exercise_name: exercise_name,
        exercise_data: canonical_data.to_s
      )
    end

    def extractor
      Files::GeneratorCases.proc?(exercise_name) ? CaseValues::ProcExtractor : CaseValues::AutoExtractor
    end

    def cases_require_name
      Files::GeneratorCases.filename(exercise_name)
    end
  end
end
