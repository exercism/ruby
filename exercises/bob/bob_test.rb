#!/usr/bin/env ruby
require 'minitest/autorun'
require_relative 'bob'

class BobTest < Minitest::Test
  def bob
    Bob
  end

  def feedback(text)
    "Bob hears #{text.inspect}, and.."
  end

  def test_stating_something
    remark = 'Tom-ay-to, tom-aaaah-to.'
    assert_equal 'Whatever.', bob.hey(remark), feedback(remark)
  end

  def test_shouting
    skip
    remark = 'WATCH OUT!'
    assert_equal 'Whoa, chill out!', bob.hey(remark), feedback(remark)
  end

  def test_shouting_gibberish
    skip
    remark = ('A'..'Z').to_a.sample(10).join
    assert_equal 'Whoa, chill out!', bob.hey(remark), feedback(remark)
  end

  def test_asking_a_question
    skip
    remark = 'Does this cryogenic chamber make me look fat?'
    assert_equal 'Sure.', bob.hey(remark), feedback(remark)
  end

  def test_asking_a_numeric_question
    skip
    remark = 'You are, what, like 15?'
    assert_equal 'Sure.', bob.hey(remark), feedback(remark)
  end

  def test_asking_gibberish
    skip
    remark = ('a'..'z').to_a.sample(10).join << '?'
    assert_equal 'Sure.', bob.hey(remark), feedback(remark)
  end

  def test_talking_forcefully
    skip
    remark = "Let's go make out behind the gym!"
    assert_equal 'Whatever.', bob.hey(remark), feedback(remark)
  end

  def test_using_acronyms_in_regular_speech
    skip
    remark = "It's OK if you don't want to go to the DMV."
    assert_equal 'Whatever.', bob.hey(remark), feedback(remark)
  end

  def test_forceful_questions
    skip
    remark = 'WHAT THE HELL WERE YOU THINKING?'
    assert_equal 'Whoa, chill out!', bob.hey(remark), feedback(remark)
  end

  def test_shouting_numbers
    skip
    remark = '1, 2, 3 GO!'
    assert_equal 'Whoa, chill out!', bob.hey(remark), feedback(remark)
  end

  def test_only_numbers
    skip
    remark = '1, 2, 3'
    assert_equal 'Whatever.', bob.hey(remark), feedback(remark)
  end

  def test_question_with_only_numbers
    skip
    remark = '4?'
    assert_equal 'Sure.', bob.hey(remark), feedback(remark)
  end

  def test_shouting_with_special_characters
    skip
    remark = 'ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!'
    assert_equal 'Whoa, chill out!', bob.hey(remark), feedback(remark)
  end

  def test_shouting_with_no_exclamation_mark
    skip
    remark = 'I HATE YOU'
    assert_equal 'Whoa, chill out!', bob.hey(remark), feedback(remark)
  end

  def test_statement_containing_question_mark
    skip
    remark = 'Ending with ? means a question.'
    assert_equal 'Whatever.', bob.hey(remark), feedback(remark)
  end

  def test_prattling_on
    skip
    remark = 'Wait! Hang on. Are you going to be OK?'
    assert_equal 'Sure.', bob.hey(remark), feedback(remark)
  end

  def test_silence
    skip
    remark = ''
    assert_equal 'Fine. Be that way!', bob.hey(remark), feedback(remark)
  end

  def test_prolonged_silence
    skip
    remark = ' ' * rand(1..10)
    assert_equal 'Fine. Be that way!', bob.hey(remark), feedback(remark)
  end

  def test_alternate_silences
    skip
    remark = "\t" * rand(1..10)
    assert_equal 'Fine. Be that way!', bob.hey(remark), feedback(remark)
  end

  def test_on_multiple_line_questions
    skip
    remark = %(
Does this cryogenic chamber make me look fat?
no)
    assert_equal 'Whatever.', bob.hey(remark), feedback(remark)
  end

  # Problems in exercism evolve over time, as we find better ways to ask
  # questions.
  # The version number refers to the version of the problem you solved,
  # not your solution.
  #
  # Define a constant named VERSION inside of the top level BookKeeping
  # module, which may be placed near the end of your file.
  #
  # In your file, it will look like this:
  #
  # module BookKeeping
  #   VERSION = 1 # Where the version number matches the one in the test.
  # end
  #
  # If you are curious, read more about constants on RubyDoc:
  # http://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/constants.html

  def test_bookkeeping
    assert_equal 1, BookKeeping::VERSION
  end
end
