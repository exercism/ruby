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
    include CaseValues::Extract

    def template_values
      TemplateValues.new(
        abbreviated_commit_hash: canonical_data.abbreviated_commit_hash,
        version: version,
        test_cases: extract
      )
    end
  end

end
