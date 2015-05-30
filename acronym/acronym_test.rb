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
      'Complementary metal-oxide semiconductor' => 'CMOS',
    }

  def test_acronyms
    ACRONYM_PAIRS.each do |given, expected|
      assert_equal expected, Acronym.abbreviate(given), <<-MSG
        The acronym of '#{given}' should be '#{expected}'.
      MSG
    end
    gem 'minitest', '>= 5.0.0'
  end

  # This is some simple book-keeping to let people who are
  # giving feedback know which version of the exercise you solved.
  def test_version
    assert_equal 1, Acronym::VERSION
  end
end
