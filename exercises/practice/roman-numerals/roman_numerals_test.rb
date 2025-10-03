require 'minitest/autorun'
require_relative 'roman_numerals'

class RomanNumeralsTest < Minitest::Test
  def test_1_is_i
    # skip
    actual = 1.to_roman
    expected = 'I'
    assert_equal expected, actual
  end

  def test_2_is_ii
    skip
    actual = 2.to_roman
    expected = 'II'
    assert_equal expected, actual
  end

  def test_3_is_iii
    skip
    actual = 3.to_roman
    expected = 'III'
    assert_equal expected, actual
  end

  def test_4_is_iv
    skip
    actual = 4.to_roman
    expected = 'IV'
    assert_equal expected, actual
  end

  def test_5_is_v
    skip
    actual = 5.to_roman
    expected = 'V'
    assert_equal expected, actual
  end

  def test_6_is_vi
    skip
    actual = 6.to_roman
    expected = 'VI'
    assert_equal expected, actual
  end

  def test_9_is_ix
    skip
    actual = 9.to_roman
    expected = 'IX'
    assert_equal expected, actual
  end

  def test_16_is_xvi
    skip
    actual = 16.to_roman
    expected = 'XVI'
    assert_equal expected, actual
  end

  def test_27_is_xxvii
    skip
    actual = 27.to_roman
    expected = 'XXVII'
    assert_equal expected, actual
  end

  def test_48_is_xlviii
    skip
    actual = 48.to_roman
    expected = 'XLVIII'
    assert_equal expected, actual
  end

  def test_49_is_xlix
    skip
    actual = 49.to_roman
    expected = 'XLIX'
    assert_equal expected, actual
  end

  def test_59_is_lix
    skip
    actual = 59.to_roman
    expected = 'LIX'
    assert_equal expected, actual
  end

  def test_66_is_lxvi
    skip
    actual = 66.to_roman
    expected = 'LXVI'
    assert_equal expected, actual
  end

  def test_93_is_xciii
    skip
    actual = 93.to_roman
    expected = 'XCIII'
    assert_equal expected, actual
  end

  def test_141_is_cxli
    skip
    actual = 141.to_roman
    expected = 'CXLI'
    assert_equal expected, actual
  end

  def test_163_is_clxiii
    skip
    actual = 163.to_roman
    expected = 'CLXIII'
    assert_equal expected, actual
  end

  def test_166_is_clxvi
    skip
    actual = 166.to_roman
    expected = 'CLXVI'
    assert_equal expected, actual
  end

  def test_402_is_cdii
    skip
    actual = 402.to_roman
    expected = 'CDII'
    assert_equal expected, actual
  end

  def test_575_is_dlxxv
    skip
    actual = 575.to_roman
    expected = 'DLXXV'
    assert_equal expected, actual
  end

  def test_666_is_dclxvi
    skip
    actual = 666.to_roman
    expected = 'DCLXVI'
    assert_equal expected, actual
  end

  def test_911_is_cmxi
    skip
    actual = 911.to_roman
    expected = 'CMXI'
    assert_equal expected, actual
  end

  def test_1024_is_mxxiv
    skip
    actual = 1024.to_roman
    expected = 'MXXIV'
    assert_equal expected, actual
  end

  def test_1666_is_mdclxvi
    skip
    actual = 1666.to_roman
    expected = 'MDCLXVI'
    assert_equal expected, actual
  end

  def test_3000_is_mmm
    skip
    actual = 3000.to_roman
    expected = 'MMM'
    assert_equal expected, actual
  end

  def test_3001_is_mmmi
    skip
    actual = 3001.to_roman
    expected = 'MMMI'
    assert_equal expected, actual
  end

  def test_3888_is_mmmdccclxxxviii
    skip
    actual = 3888.to_roman
    expected = 'MMMDCCCLXXXVIII'
    assert_equal expected, actual
  end

  def test_3999_is_mmmcmxcix
    skip
    actual = 3999.to_roman
    expected = 'MMMCMXCIX'
    assert_equal expected, actual
  end
end
