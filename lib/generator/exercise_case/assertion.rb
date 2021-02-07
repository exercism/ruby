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
      # Example:
      #
      #  assert_or_refute(expected, "Luhn.valid?(#{input.inspect})")
      #
      def assert_or_refute(expected, actual)
        assertion = expected ? 'assert' : 'refute'
        "#{assertion} #{actual}\n"
      end

      # generates assertions of the form
      #
      #   assert_nil whatever
      #   assert_equal expected, whatever
      #
      # depending on whether 'expected' is nil or not
      #
      # Example:
      #
      #   assert_equal(expected, "PigLatin.translate(#{input.inspect})")
      #
      def assert_equal(expected, actual)
        assertion = expected.nil? ? 'assert_nil' : "assert_equal #{expected.inspect},"
        "#{assertion} #{actual}\n"
      end

      # generates assertions of the form
      #
      #   assert_raises(SomeError) do
      #     whatever
      #   end
      #
      # Example
      #
      #   assert_raises(ArgumentError, 'Say.new(number).in_english')
      #
      def assert_raises(error, actual)
        [
          "assert_raises(#{error}) do\n",
          "#{actual}\n".gsub(/^/, '  '), # indent by 2
          "end\n"
        ].join
      end
    end
  end
end
