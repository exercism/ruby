require 'minitest/autorun'
require_relative 'isbn_verifier'

class IsbnVerifierTest < Minitest::Test
  def test_valid_isbn
    # skip
    assert IsbnVerifier.valid?("3-598-21508-8")
  end

  def test_invalid_isbn_check_digit
    skip
    refute IsbnVerifier.valid?("3-598-21508-9")
  end

  def test_valid_isbn_with_a_check_digit_of_10
    skip
    assert IsbnVerifier.valid?("3-598-21507-X")
  end

  def test_check_digit_is_a_character_other_than_x
    skip
    refute IsbnVerifier.valid?("3-598-21507-A")
  end

  def test_invalid_check_digit_in_isbn_is_not_treated_as_zero
    skip
    refute IsbnVerifier.valid?("4-598-21507-B")
  end

  def test_invalid_character_in_isbn_is_not_treated_as_zero
    skip
    refute IsbnVerifier.valid?("3-598-P1581-X")
  end

  def test_x_is_only_valid_as_a_check_digit
    skip
    refute IsbnVerifier.valid?("3-598-2X507-9")
  end

  def test_valid_isbn_without_separating_dashes
    skip
    assert IsbnVerifier.valid?("3598215088")
  end

  def test_isbn_without_separating_dashes_and_x_as_check_digit
    skip
    assert IsbnVerifier.valid?("359821507X")
  end

  def test_isbn_without_check_digit_and_dashes
    skip
    refute IsbnVerifier.valid?("359821507")
  end

  def test_too_long_isbn_and_no_dashes
    skip
    refute IsbnVerifier.valid?("3598215078X")
  end

  def test_too_short_isbn
    skip
    refute IsbnVerifier.valid?("00")
  end

  def test_isbn_without_check_digit
    skip
    refute IsbnVerifier.valid?("3-598-21507")
  end

  def test_check_digit_of_x_should_not_be_used_for_0
    skip
    refute IsbnVerifier.valid?("3-598-21515-X")
  end

  def test_empty_isbn
    skip
    refute IsbnVerifier.valid?("")
  end

  def test_input_is_9_characters
    skip
    refute IsbnVerifier.valid?("134456729")
  end

  def test_invalid_characters_are_not_ignored_after_checking_length
    skip
    refute IsbnVerifier.valid?("3132P34035")
  end

  def test_invalid_characters_are_not_ignored_before_checking_length
    skip
    refute IsbnVerifier.valid?("3598P215088")
  end

  def test_input_is_too_long_but_contains_a_valid_isbn
    skip
    refute IsbnVerifier.valid?("98245726788")
  end
end
