require 'minitest/autorun'
require_relative 'roman_numerals'

class RomanNumeralsTest < Minitest::Test
  def test_1_is_i
    # skip
    assert_equal "I", 1.to_roman
  end

  def test_2_is_ii
    skip
    assert_equal "II", 2.to_roman
  end

  def test_3_is_iii
    skip
    assert_equal "III", 3.to_roman
  end

  def test_4_is_iv
    skip
    assert_equal "IV", 4.to_roman
  end

  def test_5_is_v
    skip
    assert_equal "V", 5.to_roman
  end

  def test_6_is_vi
    skip
    assert_equal "VI", 6.to_roman
  end

  def test_9_is_ix
    skip
    assert_equal "IX", 9.to_roman
  end

  def test_27_is_xxvii
    skip
    assert_equal "XXVII", 27.to_roman
  end

  def test_48_is_xlviii
    skip
    assert_equal "XLVIII", 48.to_roman
  end

  def test_49_is_xlix
    skip
    assert_equal "XLIX", 49.to_roman
  end

  def test_59_is_lix
    skip
    assert_equal "LIX", 59.to_roman
  end

  def test_93_is_xciii
    skip
    assert_equal "XCIII", 93.to_roman
  end

  def test_141_is_cxli
    skip
    assert_equal "CXLI", 141.to_roman
  end

  def test_163_is_clxiii
    skip
    assert_equal "CLXIII", 163.to_roman
  end

  def test_402_is_cdii
    skip
    assert_equal "CDII", 402.to_roman
  end

  def test_575_is_dlxxv
    skip
    assert_equal "DLXXV", 575.to_roman
  end

  def test_911_is_cmxi
    skip
    assert_equal "CMXI", 911.to_roman
  end

  def test_1024_is_mxxiv
    skip
    assert_equal "MXXIV", 1024.to_roman
  end

  def test_3000_is_mmm
    skip
    assert_equal "MMM", 3000.to_roman
  end

  def test_16_is_xvi
    skip
    assert_equal "XVI", 16.to_roman
  end

  def test_66_is_lxvi
    skip
    assert_equal "LXVI", 66.to_roman
  end

  def test_166_is_clxvi
    skip
    assert_equal "CLXVI", 166.to_roman
  end

  def test_666_is_dclxvi
    skip
    assert_equal "DCLXVI", 666.to_roman
  end

  def test_1666_is_mdclxvi
    skip
    assert_equal "MDCLXVI", 1666.to_roman
  end

  def test_3001_is_mmmi
    skip
    assert_equal "MMMI", 3001.to_roman
  end

  def test_3999_is_mmmcmxcix
    skip
    assert_equal "MMMCMXCIX", 3999.to_roman
  end
end
