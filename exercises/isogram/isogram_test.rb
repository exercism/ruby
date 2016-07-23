#!/usr/bin/env ruby
# encoding: utf-8
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'isogram'

# Test data version:
# 306975e
class IsogramTest < Minitest::Test
  def test_duplicates
    str = 'duplicates'
    assert Isogram.is_isogram?(str)
  end

  def test_eleven
    skip
    str = 'eleven'
    refute Isogram.is_isogram?(str)
  end

  def test_subdermatoglyphic
    skip
    str = 'subdermatoglyphic'
    assert Isogram.is_isogram?(str)
  end

  def test_alphabet
    skip
    str = 'Alphabet'
    refute Isogram.is_isogram?(str)
  end

  def test_thumbscrew_japingly
    skip
    str = 'thumbscrew-japingly'
    assert Isogram.is_isogram?(str)
  end

  def test_hjelmqvist_gryb_zock_pfund_wax
    skip
    str = 'Hjelmqvist-Gryb-Zock-Pfund-Wax'
    assert Isogram.is_isogram?(str)
  end

  def test_heizlrckstoabdmpfung
    skip
    str = 'Heizölrückstoßabdämpfung'
    assert Isogram.is_isogram?(str)
  end

  def test_the_quick_brown_fox
    skip
    str = 'the quick brown fox'
    refute Isogram.is_isogram?(str)
  end

  def test_emily_jung_schwartzkopf
    skip
    str = 'Emily Jung Schwartzkopf'
    assert Isogram.is_isogram?(str)
  end

  def test_lphant
    skip
    str = 'éléphant'
    refute Isogram.is_isogram?(str)
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
    skip
    assert_equal 1, BookKeeping::VERSION
  end
end
