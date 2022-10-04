require 'minitest/autorun'
require_relative 'bob'

class BobTest < Minitest::Test
  def test_stating_something
    # skip
    remark = "Tom-ay-to, tom-aaaah-to."
    assert_equal "Whatever.", Bob.hey(remark), 'Bob hears "Tom-ay-to, tom-aaaah-to.", and..'
  end

  def test_shouting
    skip
    remark = "WATCH OUT!"
    assert_equal "Whoa, chill out!", Bob.hey(remark), 'Bob hears "WATCH OUT!", and..'
  end

  def test_shouting_gibberish
    skip
    remark = "FCECDFCAAB"
    assert_equal "Whoa, chill out!", Bob.hey(remark), 'Bob hears "FCECDFCAAB", and..'
  end

  def test_asking_a_question
    skip
    remark = "Does this cryogenic chamber make me look fat?"
    assert_equal "Sure.", Bob.hey(remark), 'Bob hears "Does this cryogenic chamber make me look fat?", and..'
  end

  def test_asking_a_numeric_question
    skip
    remark = "You are, what, like 15?"
    assert_equal "Sure.", Bob.hey(remark), 'Bob hears "You are, what, like 15?", and..'
  end

  def test_asking_gibberish
    skip
    remark = "fffbbcbeab?"
    assert_equal "Sure.", Bob.hey(remark), 'Bob hears "fffbbcbeab?", and..'
  end

  def test_talking_forcefully
    skip
    remark = "Hi there!"
    assert_equal "Whatever.", Bob.hey(remark), 'Bob hears "Hi there!", and..'
  end

  def test_using_acronyms_in_regular_speech
    skip
    remark = "It's OK if you don't want to go work for NASA."
    assert_equal "Whatever.", Bob.hey(remark), %q(Bob hears "It's OK if you don't want to go work for NASA.", and..)
  end

  def test_forceful_question
    skip
    remark = "WHAT'S GOING ON?"
    assert_equal "Calm down, I know what I'm doing!", Bob.hey(remark), %q(Bob hears "WHAT'S GOING ON?", and..)
  end

  def test_shouting_numbers
    skip
    remark = "1, 2, 3 GO!"
    assert_equal "Whoa, chill out!", Bob.hey(remark), 'Bob hears "1, 2, 3 GO!", and..'
  end

  def test_no_letters
    skip
    remark = "1, 2, 3"
    assert_equal "Whatever.", Bob.hey(remark), 'Bob hears "1, 2, 3", and..'
  end

  def test_question_with_no_letters
    skip
    remark = "4?"
    assert_equal "Sure.", Bob.hey(remark), 'Bob hears "4?", and..'
  end

  def test_shouting_with_special_characters
    skip
    remark = "ZOMG THE %^*@\#$(*^ ZOMBIES ARE COMING!!11!!1!"
    assert_equal "Whoa, chill out!", Bob.hey(remark), %q{Bob hears "ZOMG THE %^*@\#$(*^ ZOMBIES ARE COMING!!11!!1!", and..}
  end

  def test_shouting_with_no_exclamation_mark
    skip
    remark = "I HATE THE DENTIST"
    assert_equal "Whoa, chill out!", Bob.hey(remark), 'Bob hears "I HATE THE DENTIST", and..'
  end

  def test_statement_containing_question_mark
    skip
    remark = "Ending with ? means a question."
    assert_equal "Whatever.", Bob.hey(remark), 'Bob hears "Ending with ? means a question.", and..'
  end

  def test_non_letters_with_question
    skip
    remark = ":) ?"
    assert_equal "Sure.", Bob.hey(remark), 'Bob hears ":) ?", and..'
  end

  def test_prattling_on
    skip
    remark = "Wait! Hang on. Are you going to be OK?"
    assert_equal "Sure.", Bob.hey(remark), 'Bob hears "Wait! Hang on. Are you going to be OK?", and..'
  end

  def test_silence
    skip
    remark = ""
    assert_equal "Fine. Be that way!", Bob.hey(remark), 'Bob hears "", and..'
  end

  def test_prolonged_silence
    skip
    remark = "          "
    assert_equal "Fine. Be that way!", Bob.hey(remark), 'Bob hears "          ", and..'
  end

  def test_alternate_silence
    skip
    remark = "\t\t\t\t\t\t\t\t\t\t"
    assert_equal "Fine. Be that way!", Bob.hey(remark), %q(Bob hears "\t\t\t\t\t\t\t\t\t\t", and..)
  end

  def test_multiple_line_question
    skip
    remark = "\nDoes this cryogenic chamber make me look fat?\nNo."
    assert_equal "Whatever.", Bob.hey(remark), %q(Bob hears "\nDoes this cryogenic chamber make me look fat?\nNo.", and..)
  end

  def test_starting_with_whitespace
    skip
    remark = "         hmmmmmmm..."
    assert_equal "Whatever.", Bob.hey(remark), 'Bob hears "         hmmmmmmm...", and..'
  end

  def test_ending_with_whitespace
    skip
    remark = "Okay if like my  spacebar  quite a bit?   "
    assert_equal "Sure.", Bob.hey(remark), 'Bob hears "Okay if like my  spacebar  quite a bit?   ", and..'
  end

  def test_other_whitespace
    skip
    remark = "\n\r \t"
    assert_equal "Fine. Be that way!", Bob.hey(remark), %q(Bob hears "\n\r \t", and..)
  end

  def test_non_question_ending_with_whitespace
    skip
    remark = "This is a statement ending with whitespace      "
    assert_equal "Whatever.", Bob.hey(remark), 'Bob hears "This is a statement ending with whitespace      ", and..'
  end
end
