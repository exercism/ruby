module Generator
  class ExerciseCase < OpenStruct
    module Assertion

      #  "#{assert} Luhn.valid?(#{input.inspect})"
      def assert
        expected ? 'assert' : 'refute'
      end

      # e.g.,
      #   assert_equal { "PigLatin.translate(#{input.inspect})" }
      def assert_equal
        "assert_equal #{expected.inspect}, #{yield}"
      end

      # e.g.,
      #   if raises_error?
      #     assert_raises(ArgumentError) { test_case }
      #   else
      #     assert_equal { test_case }
      #   end
      def raises_error?
        expected.to_i == -1
      end

      # e.g.,
      #   assert_raises(ArgumentError) { test_case }
      def assert_raises(error)
        "assert_raises(#{error}) { #{yield} }"
      end
    end
  end
end
