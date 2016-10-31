#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'tournament'

# Test data version:
# 0a51cfc
class TournamentTest < Minitest::Test

  def test_typical_input
    # skip
    input = <<-INPUT.gsub(/^ */, '')
      Allegoric Alaskans;Blithering Badgers;win
      Devastating Donkeys;Courageous Californians;draw
      Devastating Donkeys;Allegoric Alaskans;win
      Courageous Californians;Blithering Badgers;loss
      Blithering Badgers;Devastating Donkeys;loss
      Allegoric Alaskans;Courageous Californians;win
    INPUT
    actual = Tournament.tally(input)
    expected = <<-TALLY.gsub(/^ */, '')
      Team                           | MP |  W |  D |  L |  P
      Devastating Donkeys            |  3 |  2 |  1 |  0 |  7
      Allegoric Alaskans             |  3 |  2 |  0 |  1 |  6
      Blithering Badgers             |  3 |  1 |  0 |  2 |  3
      Courageous Californians        |  3 |  0 |  1 |  2 |  1
    TALLY
    assert_equal expected, actual
  end

  def test_incomplete_competition_not_all_pairs_have_played
    skip
    input = <<-INPUT.gsub(/^ */, '')
      Allegoric Alaskans;Blithering Badgers;loss
      Devastating Donkeys;Allegoric Alaskans;loss
      Courageous Californians;Blithering Badgers;draw
      Allegoric Alaskans;Courageous Californians;win
    INPUT
    actual = Tournament.tally(input)
    expected = <<-TALLY.gsub(/^ */, '')
      Team                           | MP |  W |  D |  L |  P
      Allegoric Alaskans             |  3 |  2 |  0 |  1 |  6
      Blithering Badgers             |  2 |  1 |  1 |  0 |  4
      Courageous Californians        |  2 |  0 |  1 |  1 |  1
      Devastating Donkeys            |  1 |  0 |  0 |  1 |  0
    TALLY
    assert_equal expected, actual
  end

  def test_ties_broken_alphabetically
    skip
    input = <<-INPUT.gsub(/^ */, '')
      Courageous Californians;Devastating Donkeys;win
      Allegoric Alaskans;Blithering Badgers;win
      Devastating Donkeys;Allegoric Alaskans;loss
      Courageous Californians;Blithering Badgers;win
      Blithering Badgers;Devastating Donkeys;draw
      Allegoric Alaskans;Courageous Californians;draw
    INPUT
    actual = Tournament.tally(input)
    expected = <<-TALLY.gsub(/^ */, '')
      Team                           | MP |  W |  D |  L |  P
      Allegoric Alaskans             |  3 |  2 |  1 |  0 |  7
      Courageous Californians        |  3 |  2 |  1 |  0 |  7
      Blithering Badgers             |  3 |  0 |  1 |  2 |  1
      Devastating Donkeys            |  3 |  0 |  1 |  2 |  1
    TALLY
    assert_equal expected, actual
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
