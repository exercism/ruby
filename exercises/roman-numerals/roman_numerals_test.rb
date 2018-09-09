require 'minitest/autorun'
require_relative 'roman_numerals'

# Common test data version: 1.2.0 3c78ac4
class RomanNumeralsTest < Minitest::Test
  def test_1_is_a_single_i
    # skip
    assert_equal 'I', 1.to_roman
  end

  def test_2_is_two_i_s
    skip
    assert_equal 'II', 2.to_roman
  end

  def test_3_is_three_i_s
    skip
    assert_equal 'III', 3.to_roman
  end

  def test_4_being_5_1_is_iv
    skip
    assert_equal 'IV', 4.to_roman
  end

  def test_5_is_a_single_v
    skip
    assert_equal 'V', 5.to_roman
  end

  def test_6_being_5_1_is_vi
    skip
    assert_equal 'VI', 6.to_roman
  end

  def test_9_being_10_1_is_ix
    skip
    assert_equal 'IX', 9.to_roman
  end

  def test_20_is_two_x_s
    skip
    assert_equal 'XXVII', 27.to_roman
  end

  def test_48_is_not_50_2_but_rather_40_8
    skip
    assert_equal 'XLVIII', 48.to_roman
  end

  def test_49_is_not_40_5_4_but_rather_50_10_10_1
    skip
    assert_equal 'XLIX', 49.to_roman
  end

  def test_50_is_a_single_l
    skip
    assert_equal 'LIX', 59.to_roman
  end

  def test_90_being_100_10_is_xc
    skip
    assert_equal 'XCIII', 93.to_roman
  end

  def test_100_is_a_single_c
    skip
    assert_equal 'CXLI', 141.to_roman
  end

  def test_60_being_50_10_is_lx
    skip
    assert_equal 'CLXIII', 163.to_roman
  end

  def test_400_being_500_100_is_cd
    skip
    assert_equal 'CDII', 402.to_roman
  end

  def test_500_is_a_single_d
    skip
    assert_equal 'DLXXV', 575.to_roman
  end

  def test_900_being_1000_100_is_cm
    skip
    assert_equal 'CMXI', 911.to_roman
  end

  def test_1000_is_a_single_m
    skip
    assert_equal 'MXXIV', 1024.to_roman
  end

  def test_3000_is_three_m_s
    skip
    assert_equal 'MMM', 3000.to_roman
  end
end
