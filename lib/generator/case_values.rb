module Generator
  module CaseValues
    class Extractor
      def initialize(case_class:)
        @case_class = case_class
      end

      def cases(exercise_data)
        extract_test_cases(data: JSON.parse(exercise_data)['cases'])
          .map { |case_properties| @case_class.new(canonical: OpenStruct.new(case_properties)) }
      end

      private

      def extract_test_cases(data:)
        data.flat_map do |entry|
          entry.key?('cases') ? extract_test_cases(data: entry['cases']) : entry
        end
      end
    end
  end
end
