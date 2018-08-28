module Generator
  module CaseValues
    class Canonical < OpenStruct
      def method_missing(sym, *args, &block)
        # `input` and `expected` are required key names
        input_key = key_variant(:input, sym)
        return input[input_key] if input_key

        expected_key = key_variant(:expected, sym)
        return expected[expected_key] if expected_key

        super(sym, *args, &block)
      end

      def respond_to?(sym)
        key_variant(:input, sym) || key_variant(:expected, sym) || super
      end

      private

      def key_variant(hash_name, sym)
        if self[hash_name].is_a? Hash
          candidate_keys(key: sym.to_s, prefix: hash_name).find { |key| self[hash_name].key?(key) }
        end
      end

      def candidate_keys(key:, prefix:)
        camel_cased = camel_case(key)
        deprefixed  = key.sub(/^#{prefix}_/, '')
        deprefixed_and_camel_cased = camel_case(deprefixed)
        [key, camel_cased, deprefixed, deprefixed_and_camel_cased].uniq
      end

      def camel_case(string)
        string.gsub(/_([a-z])/) { Regexp.last_match(1).upcase }
      end
    end

    class Extractor
      def initialize(case_class:)
        @case_class = case_class
      end

      def cases(exercise_data)
        extract_test_cases(data: JSON.parse(exercise_data)['cases'])
          .map { |case_properties| @case_class.new(canonical: Canonical.new(case_properties)) }
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
