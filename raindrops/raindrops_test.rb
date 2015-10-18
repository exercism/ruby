#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'raindrops'

# Test data version:
# 0b286d1 Added rna-transcription.json test definition

class RaindropsTest < Minitest::Test
  def test_1
    assert_equal '1', Raindrops.convert(1),
                 'No, raindrop-speak of 1 is 1.'
  end

  def test_3
    skip
    assert_equal 'Pling', Raindrops.convert(3),
                 'No, raindrop-speak of 3 is Pling.'
  end

  def test_5
    skip
    assert_equal 'Plang', Raindrops.convert(5),
                 'No, raindrop-speak of 5 is Plang.'
  end

  def test_7
    skip
    assert_equal 'Plong', Raindrops.convert(7),
                 'No, raindrop-speak of 7 is Plong.'
  end

  def test_6
    skip
    assert_equal 'Pling', Raindrops.convert(6),
                 'No, raindrop-speak of 6 is Pling.'
  end

  def test_9
    skip
    assert_equal 'Pling', Raindrops.convert(9),
                 'No, raindrop-speak of 9 is Pling.'
  end

  def test_10
    skip
    assert_equal 'Plang', Raindrops.convert(10),
                 'No, raindrop-speak of 10 is Plang.'
  end

  def test_14
    skip
    assert_equal 'Plong', Raindrops.convert(14),
                 'No, raindrop-speak of 14 is Plong.'
  end

  def test_15
    skip
    assert_equal 'PlingPlang', Raindrops.convert(15),
                 'No, raindrop-speak of 15 is PlingPlang.'
  end

  def test_21
    skip
    assert_equal 'PlingPlong', Raindrops.convert(21),
                 'No, raindrop-speak of 21 is PlingPlong.'
  end

  def test_25
    skip
    assert_equal 'Plang', Raindrops.convert(25),
                 'No, raindrop-speak of 25 is Plang.'
  end

  def test_35
    skip
    assert_equal 'PlangPlong', Raindrops.convert(35),
                 'No, raindrop-speak of 35 is PlangPlong.'
  end

  def test_49
    skip
    assert_equal 'Plong', Raindrops.convert(49),
                 'No, raindrop-speak of 49 is Plong.'
  end

  def test_52
    skip
    assert_equal '52', Raindrops.convert(52),
                 'No, raindrop-speak of 52 is 52.'
  end

  def test_105
    skip
    assert_equal 'PlingPlangPlong', Raindrops.convert(105),
                 'No, raindrop-speak of 105 is PlingPlangPlong.'
  end

  def test_12_121
    skip
    assert_equal '12121', Raindrops.convert(12_121),
                 'No, raindrop-speak of 12_121 is 12121.'
  end

  # Problems in exercism evolve over time,
  # as we find better ways to ask questions.
  # The version number refers to the version of the problem you solved,
  # not your solution.
  #
  # Define a constant named VERSION inside of Raindrops.
  # If you are curious, read more about constants on RubyDoc:
  # http://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/constants.html
  def test_bookkeeping
    skip
    assert_equal 1, Raindrops::VERSION
  end
end
