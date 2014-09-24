require 'minitest/autorun'
begin
  require_relative 'bob'
rescue LoadError => e
  puts "\n\n#{e.backtrace.first} #{e.message}"
  puts DATA.read
  exit 1
end

class BobTest < MiniTest::Unit::TestCase
  def test_stating_something
    assert_equal 'Whatever.', ::Bob.new.hey('Tom-ay-to, tom-aaaah-to.')
  end

  def test_shouting
    skip
    assert_equal 'Whoa, chill out!', ::Bob.new.hey('WATCH OUT!')
  end

  def test_shouting_gibberish
    skip
    gibberish = ('A'..'Z').to_a.shuffle[0,10].join
    assert_equal 'Whoa, chill out!', ::Bob.new.hey(gibberish)
  end

  def test_asking_a_question
    skip
    assert_equal 'Sure.', ::Bob.new.hey('Does this cryogenic chamber make me look fat?')
  end

  def test_asking_a_numeric_question
    skip
    assert_equal 'Sure.', ::Bob.new.hey('You are, what, like 15?')
  end

  def test_asking_gibberish
    skip
    gibberish = ('a'..'z').to_a.shuffle[0,10].join
    assert_equal 'Sure.', ::Bob.new.hey("#{gibberish}?")
  end

  def test_talking_forcefully
    skip
    assert_equal 'Whatever.', ::Bob.new.hey("Let's go make out behind the gym!")
  end

  def test_using_acronyms_in_regular_speech
    skip
    assert_equal 'Whatever.', ::Bob.new.hey("It's OK if you don't want to go to the DMV.")
  end

  def test_forceful_questions
    skip
    assert_equal 'Whoa, chill out!', ::Bob.new.hey('WHAT THE HELL WERE YOU THINKING?')
  end

  def test_shouting_numbers
    skip
    assert_equal 'Whoa, chill out!', ::Bob.new.hey('1, 2, 3 GO!')
  end

  def test_only_numbers
    skip
    assert_equal 'Whatever.', ::Bob.new.hey('1, 2, 3')
  end

  def test_question_with_only_numbers
    skip
    assert_equal 'Sure.', ::Bob.new.hey('4?')
  end

  def test_shouting_with_special_characters
    skip
    assert_equal 'Whoa, chill out!', ::Bob.new.hey('ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!')
  end

  def test_shouting_with_no_exclamation_mark
    skip
    assert_equal 'Whoa, chill out!', ::Bob.new.hey('I HATE YOU')
  end

  def test_statement_containing_question_mark
    skip
    assert_equal 'Whatever.', ::Bob.new.hey('Ending with ? means a question.')
  end

  def test_prattling_on
    skip
    assert_equal 'Sure.', ::Bob.new.hey("Wait! Hang on. Are you going to be OK?")
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
    assert_equal 'Whatever.', ::Bob.new.hey(%{
Does this cryogenic chamber make me look fat?
no})
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

