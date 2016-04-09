#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'pangram'

# Test data version:
# 180638f Merge pull request #217 from ErikSchierboom/patch-2

class PangramTest < Minitest::Test
  # Below we use `%Q` syntax to create strings.
  # This let's us worry less about escaping quotes.
  # You can read more about Ruby's string literal syntax here:
  # http://ruby-doc.org/core-2.3.0/doc/syntax/literals_rdoc.html#label-Strings

  def test_sentence_empty
    str = %Q()
    refute Pangram.is_pangram?(str)
  end

  def test_pangram_with_only_lower_case
    skip
    str = %Q(the quick brown fox jumps over the lazy dog)
    assert Pangram.is_pangram?(str)
  end

  def test_missing_character_x
    skip
    str = %Q(a quick movement of the enemy will jeopardize five gunboats)
    refute Pangram.is_pangram?(str)
  end

  def test_pangram_with_mixed_case_and_punctuation
    skip
    str = %Q("Five quacking Zephyrs jolt my wax bed.")
    assert Pangram.is_pangram?(str)
  end

  def test_pangram_with_non_ascii_characters
    skip
    str = %Q(Victor jagt zwölf Boxkämpfer quer über den großen Sylter Deich.)
    assert Pangram.is_pangram?(str)
  end

  # Problems in exercism evolve over time,
  # as we find better ways to ask questions.
  # The version number refers to the version of the problem you solved,
  # not your solution.
  #
  # Define a constant named VERSION inside of Pangram.
  # If you are curious, read more about constants on RubyDoc:
  # http://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/constants.html
  def test_bookkeeping
    skip
    assert_equal 1, Pangram::VERSION
  end
end
