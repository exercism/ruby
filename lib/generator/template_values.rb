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
        test_cases: test_cases
      )
    end

    private

    def cases_require_name
      Files::GeneratorCases.filename(exercise_name)
    end

    def test_cases
      if test_cases_proc?
        test_cases_proc.call(canonical_data.to_s)
      else
        test_cases_with_index
      end
    end

    def test_cases_with_index
      extract_test_cases.compact.
        map.with_index {|test, index| test_case_class.new(test.merge('index' => index)) }
    end

    def extract_test_cases(data = JSON.parse(canonical_data.to_s)['cases'])
      data.flat_map do |entry|
        entry.key?('cases') ? extract_test_cases(entry['cases']) : entry
      end
    end

    def test_cases_proc?
      Object.const_defined?(test_cases_procname)
    end

    def test_cases_proc
      Object.const_get(test_cases_procname)
    end

    def test_case_class
      Object.const_get(Files::GeneratorCases.class_name(exercise_name))
    end

    def test_cases_procname
      @test_cases_procname ||= Files::GeneratorCases.proc_name(exercise_name)
    end

  end
end
