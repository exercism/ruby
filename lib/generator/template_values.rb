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
        test_cases: CaseValues.extract(exercise_name: exercise_name, exercise_data: canonical_data.to_s)
      )
    end
  end

  class CaseValues
    def self.extract(exercise_name:, exercise_data:)
      CaseValues.new(exercise_name: exercise_name, exercise_data: exercise_data).extract
    end

    def initialize(exercise_name:, exercise_data:)
      @exercise_name = exercise_name
      @exercise_data = exercise_data

      require cases_require_name
    end

    attr_reader :exercise_name, :exercise_data

    def extract
      # TODO: for backwards compatibility, remove post-conversion
      return test_cases_proc.call(exercise_data) if test_cases_proc

      extract_test_cases.
        map.with_index {|test, index| test_case_class.new(test.merge('index' => index)) }
    end

    private

    # TODO: for backwards compatibility, remove post-conversion
    def test_cases_proc
      if Object.const_defined?(test_cases_procname)
        Object.const_get(test_cases_procname)
      end
    end

    # TODO: for backwards compatibility, remove post-conversion
    def test_cases_procname
      @test_cases_procname ||= Files::GeneratorCases.proc_name(exercise_name)
    end

    def extract_test_cases(data: JSON.parse(exercise_data)['cases'])
      data.flat_map do |entry|
        entry.key?('cases') ? extract_test_cases(data: entry['cases']) : entry
      end
    end

    def test_case_class
      Object.const_get(Files::GeneratorCases.class_name(exercise_name))
    end

    def cases_require_name
      Files::GeneratorCases.filename(exercise_name)
    end
  end
end
