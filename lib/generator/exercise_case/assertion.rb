module Generator
  class ExerciseCase
    module Assertion

      # generates assertions of the form
      #
      #   assert whatever
      #   refute whatever
      #
      # depending on whether 'expected' is true or false
      #
      # call as
      #
      #  "#{assert} Luhn.valid?(#{input.inspect})"
      #
      def assert
        case_data['expected'] ? 'assert' : 'refute'
      end

      # generates assertions of the form
      #
      #   assert_nil whatever
      #   assert_equal expected, whatever
      #
      # depending on whether 'expected' is nil or not
      #
      # call as
      #
      #   assert_equal { "PigLatin.translate(#{input.inspect})" }
      #
      def assert_equal
        assertion = case_data['expected'].nil? ? 'assert_nil' :
                      "assert_equal #{case_data['expected'].inspect},"
        "#{assertion} #{yield}"
      end

      # a helper function, used to build statements such as
      #
      #   if raises_error?
      #     assert_raises(ArgumentError) { test_case }
      #   else
      #     assert_equal { test_case }
      #   end
      #
      def raises_error?
        case_data['expected'].to_i == -1
      end

      # generates assertions of the form
      #
      #   assert_raises(SomeError) { whatever }
      #
      # call as
      #
      #   assert_raises(ArgumentError) { test_case }
      #
      def assert_raises(error)
        "assert_raises(#{error}) { #{yield} }"
      end
    end
  end
end
