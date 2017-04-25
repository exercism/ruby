module Generator
  module CaseValues

    module Extract

      def extract
        extractor.extract(
          exercise_name: exercise_name,
          exercise_data: canonical_data.to_s
        )
      end

      private

      def extractor
        Files::GeneratorCases.proc?(exercise_name) ? ProcExtractor : AutoExtractor
      end

    end

    class Extractor
      attr_reader :exercise_name, :exercise_data

      def self.extract(exercise_name:, exercise_data:)
        self.new(
          exercise_name: exercise_name,
          exercise_data: exercise_data
        ).extract
      end

      def initialize(exercise_name:, exercise_data:)
        @exercise_name = exercise_name
        @exercise_data = exercise_data

        require cases_require_name
      end

      def extract
        fail NotImplementedError, 'Should return an array of ProblemNameCase'
      end

      private

      def cases_require_name
        Files::GeneratorCases.filename(exercise_name)
      end
    end

    class AutoExtractor < Extractor

      def extract
        extract_test_cases.map.with_index do |test, index|
          test_case_class.new(test.merge('index' => index))
        end
      end

      private

      def extract_test_cases(data: JSON.parse(exercise_data)['cases'])
        data.flat_map do |entry|
          entry.key?('cases') ? extract_test_cases(data: entry['cases']) : entry
        end
      end

      def test_case_class
        Object.const_get(Files::GeneratorCases.class_name(exercise_name))
      end
    end

    class ProcExtractor < Extractor

      def extract
        test_cases_proc.call(exercise_data)
      end

      private

      def test_cases_proc
        Object.const_get(Files::GeneratorCases.proc_name(exercise_name))
      end

    end

  end
end
