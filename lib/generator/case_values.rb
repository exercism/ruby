module Generator
  module CaseValues

    class Extractor
      attr_reader :exercise_name, :exercise_data

      def initialize(exercise_name:, exercise_data:, case_class:)
        @exercise_name = exercise_name
        @exercise_data = exercise_data
        @case_class = case_class
      end

      def extract(_)
        extract_test_cases.map.with_index do |test, index|
          @case_class.new(test.merge('index' => index))
        end
      end

      private

      def extract_test_cases(data: JSON.parse(exercise_data)['cases'])
        data.flat_map do |entry|
          entry.key?('cases') ? extract_test_cases(data: entry['cases']) : entry
        end
      end
    end
  end
end
