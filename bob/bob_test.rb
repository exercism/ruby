require 'minitest/autorun'
begin
  require_relative 'bob'
rescue LoadError => e
  puts "\n\n#{e.backtrace.first} #{e.message}"
  puts DATA.read
  exit 1
end

class BobTest < MiniTest::Unit::TestCase

  def feedback(text)
    "Bob hears #{text.inspect}, and.."
  end

  def test_stating_something
    message_to_bob = 'Tom-ay-to, tom-aaaah-to.'
    assert_equal 'Whatever.', ::Bob.new.hey(message_to_bob), feedback(message_to_bob)
  end

  def test_shouting
    skip
    message_to_bob = 'WATCH OUT!'
    assert_equal 'Whoa, chill out!', ::Bob.new.hey('WATCH OUT!'), feedback(message_to_bob)
  end

  def test_shouting_gibberish
    skip
    gibberish = ('A'..'Z').to_a.shuffle[0,10].join
    message_to_bob = gibberish
    assert_equal 'Whoa, chill out!', ::Bob.new.hey(gibberish), feedback(message_to_bob)
  end

  def test_asking_a_question
    skip
    message_to_bob = 'Does this cryogenic chamber make me look fat?'
    assert_equal 'Sure.', ::Bob.new.hey(message_to_bob), feedback(message_to_bob)
  end

  def test_asking_a_numeric_question
    skip
    message_to_bob = 'You are, what, like 15?'
    assert_equal 'Sure.', ::Bob.new.hey(message_to_bob), feedback(message_to_bob)
  end

  def test_asking_gibberish
    skip
    gibberish = ('a'..'z').to_a.shuffle[0,10].join
    assert_equal 'Sure.', ::Bob.new.hey("#{gibberish}?"), feedback(gibberish)
  end

  def test_talking_forcefully
    skip
    message_to_bob = "Let's go make out behind the gym!"
    assert_equal 'Whatever.', ::Bob.new.hey(message_to_bob), feedback(message_to_bob)
  end

  def test_using_acronyms_in_regular_speech
    skip
    message_to_bob = "It's OK if you don't want to go to the DMV."
    assert_equal 'Whatever.', ::Bob.new.hey(message_to_bob), feedback(message_to_bob)
  end

  def test_forceful_questions
    skip
    message_to_bob = 'WHAT THE HELL WERE YOU THINKING?'
    assert_equal 'Whoa, chill out!', ::Bob.new.hey(message_to_bob), feedback(message_to_bob)
  end

  def test_shouting_numbers
    skip
    message_to_bob = '1, 2, 3 GO!'
    assert_equal 'Whoa, chill out!', ::Bob.new.hey(message_to_bob), feedback(message_to_bob)
  end

  def test_only_numbers
    skip
    message_to_bob = '1, 2, 3'
    assert_equal 'Whatever.', ::Bob.new.hey(message_to_bob), feedback(message_to_bob)
  end

  def test_question_with_only_numbers
    skip
    message_to_bob = '4?'
    assert_equal 'Sure.', ::Bob.new.hey(message_to_bob), feedback(message_to_bob)
  end

  def test_shouting_with_special_characters
    skip
    message_to_bob = 'ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!'
    assert_equal 'Whoa, chill out!', ::Bob.new.hey(message_to_bob), feedback(message_to_bob)
  end

  def test_shouting_with_no_exclamation_mark
    skip
    message_to_bob = 'I HATE YOU'
    assert_equal 'Whoa, chill out!', ::Bob.new.hey(message_to_bob), feedback(message_to_bob)
  end

  def test_statement_containing_question_mark
    skip
    message_to_bob = 'Ending with ? means a question.'
    assert_equal 'Whatever.', ::Bob.new.hey(message_to_bob), feedback(message_to_bob)
  end

  def test_prattling_on
    skip
    message_to_bob = "Wait! Hang on. Are you going to be OK?"
    assert_equal 'Sure.', ::Bob.new.hey(message_to_bob), feedback(message_to_bob)
  end

  def test_silence
    skip
    assert_equal 'Fine. Be that way!', ::Bob.new.hey('')
  end

  def test_prolonged_silence
    skip
    silence = " " * rand(1..10)
    assert_equal 'Fine. Be that way!', ::Bob.new.hey(silence)
  end

  def test_alternate_silences
    skip
    silence = "\t" * rand(1..10)
    assert_equal 'Fine. Be that way!', ::Bob.new.hey(silence)
  end

  def test_on_multiple_line_questions
    skip
    message_to_bob = %{
Does this cryogenic chamber make me look fat?
no}
    assert_equal 'Whatever.', ::Bob.new.hey(message_to_bob), feedback(message_to_bob)
  end
end

__END__

*****************************************************
You got an error, which is exactly as it should be.
This is the first step in the Test-Driven Development
(TDD) process.

The most important part of the error is

      cannot load such file

It's looking for a file named bob.rb that doesn't
exist yet.

To fix the error, create an empty file named bob.rb
in the same directory as the bob_test.rb file.

Then run the test again.

For more guidance as you work on this exercise, see
GETTING_STARTED.md.
*****************************************************
