require 'minitest/autorun'
require_relative 'bob'

class BobTest < Minitest::Test
  def test_stating_something
    # skip
    assert_equal "Whatever.", Bob.hey("Tom-ay-to, tom-aaaah-to.")
  end

  def test_shouting
    skip
    assert_equal "Whoa, chill out!", Bob.hey("WATCH OUT!")
  end

  def test_shouting_gibberish
    skip
    assert_equal "Whoa, chill out!", Bob.hey("FCECDFCAAB")
  end

  def test_asking_a_question
    skip
    assert_equal "Sure.", Bob.hey("Does this cryogenic chamber make me look fat?")
  end

  def test_asking_a_numeric_question
    skip
    assert_equal "Sure.", Bob.hey("You are, what, like 15?")
  end

  def test_asking_gibberish
    skip
    assert_equal "Sure.", Bob.hey("fffbbcbeab?")
  end

  def test_talking_forcefully
    skip
    assert_equal "Whatever.", Bob.hey("Hi there!")
  end

  def test_using_acronyms_in_regular_speech
    skip
    assert_equal "Whatever.", Bob.hey("It's OK if you don't want to go work for NASA.")
  end

  def test_forceful_question
    skip
    assert_equal "Calm down, I know what I'm doing!", Bob.hey("WHAT'S GOING ON?")
  end

  def test_shouting_numbers
    skip
    assert_equal "Whoa, chill out!", Bob.hey("1, 2, 3 GO!")
  end

  def test_no_letters
    skip
    assert_equal "Whatever.", Bob.hey("1, 2, 3")
  end

  def test_question_with_no_letters
    skip
    assert_equal "Sure.", Bob.hey("4?")
  end

  def test_shouting_with_special_characters
    skip
    assert_equal "Whoa, chill out!", Bob.hey("ZOMG THE %^*@\#$(*^ ZOMBIES ARE COMING!!11!!1!")
  end

  def test_shouting_with_no_exclamation_mark
    skip
    assert_equal "Whoa, chill out!", Bob.hey("I HATE THE DENTIST")
  end

  def test_statement_containing_question_mark
    skip
    assert_equal "Whatever.", Bob.hey("Ending with ? means a question.")
  end

  def test_non_letters_with_question
    skip
    assert_equal "Sure.", Bob.hey(":) ?")
  end

  def test_prattling_on
    skip
    assert_equal "Sure.", Bob.hey("Wait! Hang on. Are you going to be OK?")
  end

  def test_silence
    skip
    assert_equal "Fine. Be that way!", Bob.hey("")
  end

  def test_prolonged_silence
    skip
    assert_equal "Fine. Be that way!", Bob.hey("          ")
  end

  def test_alternate_silence
    skip
    assert_equal "Fine. Be that way!", Bob.hey("\t\t\t\t\t\t\t\t\t\t")
  end

  def test_multiple_line_question
    skip
    assert_equal "Whatever.", Bob.hey("\nDoes this cryogenic chamber make me look fat?\nNo.")
  end

  def test_starting_with_whitespace
    skip
    assert_equal "Whatever.", Bob.hey("         hmmmmmmm...")
  end

  def test_ending_with_whitespace
    skip
    assert_equal "Sure.", Bob.hey("Okay if like my  spacebar  quite a bit?   ")
  end

  def test_other_whitespace
    skip
    assert_equal "Fine. Be that way!", Bob.hey("\n\r \t")
  end

  def test_non_question_ending_with_whitespace
    skip
    assert_equal "Whatever.", Bob.hey("This is a statement ending with whitespace      ")
  end
end
