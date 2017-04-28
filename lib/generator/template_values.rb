require 'forwardable'

module Generator
  # Contains methods accessible to the ERB template
  class TemplateValues
    attr_reader :metadata, :test_cases
    extend Forwardable
    def_delegators :@metadata, :abbreviated_commit_hash, :version, :exercise_name, :exercise_name_camel

    def initialize(metadata:, test_cases:)
      @metadata = metadata
      @test_cases = test_cases
    end

    def get_binding
      binding
    end
  end

  class TemplateMetadata
    attr_reader :abbreviated_commit_hash, :version, :exercise_name

    def initialize(abbreviated_commit_hash:, version:, exercise_name:)
      @abbreviated_commit_hash = abbreviated_commit_hash
      @version = version
      @exercise_name = exercise_name ? exercise_name.tr('-_', '_') : ''
    end

    def exercise_name_camel
      exercise_name.split(/[-_]/).map(&:capitalize).join
    end
  end

  module TemplateValuesFactory
    def template_values
      TemplateValues.new(
        metadata: TemplateMetadata.new(
          abbreviated_commit_hash: canonical_data.abbreviated_commit_hash,
          version: version,
          exercise_name: exercise_name
        ),
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
          case_class: Object.const_get(Files::GeneratorCases.class_name(exercise_name))
        )
    end

    def cases_load_name
      Files::GeneratorCases.load_filename(paths.track, exercise_name)
    end
  end
end
