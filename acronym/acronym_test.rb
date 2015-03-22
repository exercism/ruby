require 'minitest/autorun'
require_relative 'acronym'

class AcronymTest < Minitest::Test
  def test_png
    assert_equal 'PNG', Acronym.abbreviate('Portable Network Graphics')
  end

  def test_ruby_on_rails
    skip
    assert_equal 'ROR', Acronym.abbreviate('Ruby on Rails')
  end

  def test_html
    skip
    assert_equal 'HTML', Acronym.abbreviate('HyperText Markup Language')
  end

  def test_fifo
    skip
    assert_equal 'FIFO', Acronym.abbreviate('First In, First Out')
  end

  def test_php
    skip
    assert_equal 'PHP', Acronym.abbreviate('PHP: Hypertext Preprocessor')
  end

  def test_cmos
    skip
    assert_equal 'CMOS', Acronym.abbreviate('Complementary metal-oxide semiconductor')
  end
end
