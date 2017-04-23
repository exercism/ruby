require_relative '../test_helper'

module Generator
  class UnderscoreTest < MiniTest::Test
    using Underscore

    # at present, we're downcasing everything, including TLAs
    def test_mixed_case
      assert_equal 'A string with TLA'.underscore, 'a_string_with_tla'
    end

    def test_hyphenated_text
      assert_equal 'large distance in off-by-one strand'.underscore, 'large_distance_in_off_by_one_strand'
    end

    def test_question_mark
      assert_equal(
        'Unreadable but correctly sized inputs return ?'.underscore,
        'unreadable_but_correctly_sized_inputs_return_?'
      )
    end
  end
end
