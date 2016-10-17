#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'example'


class IsogramTest < Minitest::Test
  def test_duplicates
    assert_equal true, Isogram.is_isogram?("duplicates")
  end

  def test_eleven
    assert_equal false, Isogram.is_isogram?("eleven")
  end

  def test_subdermatoglyphic
    assert_equal true, Isogram.is_isogram?("subdermatoglyphic")
  end

  def test_alphabet
    assert_equal false, Isogram.is_isogram?("Alphabet")
  end

  def test_subdermatoglyphic
    assert_equal true, Isogram.is_isogram?("subdermatoglyphic")
  end

  def test_thumbscrew_japingly
    assert_equal true, Isogram.is_isogram?("thumbscrew-japingly")
  end

  def test_hjelmqvist_Gryb_Zock_Pfund_Wax
    assert_equal true, Isogram.is_isogram?("Hjelmqvist-Gryb-Zock-Pfund-Wax")
  end

  def test_heizölrückstoßabdämpfung
    assert_equal true, Isogram.is_isogram?("Heizölrückstoßabdämpfung")
  end

  def test_the_quick_brown_fox
    assert_equal false, Isogram.is_isogram?("the quick brown fox")
  end

  def test_emily_jung_schwartzkopf
    assert_equal true, Isogram.is_isogram?("Emily Jung Schwartzkopf")
  end

  def test_éléphant
    assert_equal false, Isogram.is_isogram?("éléphant")
  end

end
