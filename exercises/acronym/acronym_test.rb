#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'acronym'

class AcronymTest < Minitest::Test
  ACRONYM_PAIRS =
    {
      'Portable Network Graphics' => 'PNG',
      'Ruby on Rails' => 'ROR',
      'HyperText Markup Language' => 'HTML',
      'First In, First Out' => 'FIFO',
      'PHP: Hypertext Preprocessor' => 'PHP',
      'Complementary metal-oxide semiconductor' => 'CMOS'
    }.freeze

  def test_acronyms
    ACRONYM_PAIRS.each do |given, expected|
      assert_equal expected, Acronym.abbreviate(given), <<-MSG
        The acronym of '#{given}' should be '#{expected}'.
      MSG
    end
  end

  # Problems in exercism evolve over time,
  # as we find better ways to ask questions.
  # The version number refers to the version of the problem you solved,
  # not your solution.
  #
  # Define a constant named VERSION inside of BookKeeping.
  # If you are curious, read more about constants on RubyDoc:
  # http://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/constants.html
  def test_version
    assert_equal 1, BookKeeping::VERSION
  end
end
