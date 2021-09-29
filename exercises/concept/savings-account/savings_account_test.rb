require 'minitest/autorun'
require_relative 'savings_account'

class SavingsAccountTest < Minitest::Test
  def test_minimal_first_interest_rate
    assert_in_delta 0.5, SavingsAccount.interest_rate(0), 0.000_1
  end

  def test_tiny_first_interest_rate
    assert_in_delta 0.5, SavingsAccount.interest_rate(0.000_001), 0.000_1
  end

  def test_maximal_first_interest_rate
    assert_in_delta 0.5, SavingsAccount.interest_rate(999.999), 0.000_1
  end

  def test_minimal_second_interest_rate
    assert_in_delta 1.621, SavingsAccount.interest_rate(1_000.0), 0.000_1
  end

  def test_tiny_second_interest_rate
    assert_in_delta 1.621, SavingsAccount.interest_rate(1_000.001), 0.000_1
  end

  def test_maximal_second_interest_rate
    assert_in_delta 1.621, SavingsAccount.interest_rate(4_999.999), 0.000_1
  end

  def test_minimal_third_interest_rate
    assert_in_delta 2.475, SavingsAccount.interest_rate(5_000.0), 0.000_1
  end

  def test_tiny_third_interest_rate
    assert_in_delta 2.475, SavingsAccount.interest_rate(5_000.001), 0.000_1
  end

  def test_large_third_interest_rate
    assert_in_delta 2.475, SavingsAccount.interest_rate(555_555_555.555), 0.000_1
  end

  def test_minimal_negative_interest_rate
    assert_in_delta(-3.213, SavingsAccount.interest_rate(-0.000_1), 0.000_1)
  end

  def test_small_negative_interest_rate
    assert_in_delta(-3.213, SavingsAccount.interest_rate(-0.123), 0.000_1)
  end

  def test_regular_negative_interest_rate
    assert_in_delta(-3.213, SavingsAccount.interest_rate(-300.0), 0.000_1)
  end

  def test_large_negative_interest_rate
    assert_in_delta(-3.213, SavingsAccount.interest_rate(-55_555.444), 0.000_1)
  end

  def test_annual_balance_update_for_empty_start_balance
    assert_in_delta 0, SavingsAccount.annual_balance_update(0.0), 0.000_1
  end

  def test_annual_balance_update_for_small_positive_start_balance
    assert_in_delta 0.000_001_005, SavingsAccount.annual_balance_update(0.000_001), 0.000_000_000_1
  end

  def test_annual_balance_update_for_average_positive_start_balance
    assert_in_delta 1_016.21, SavingsAccount.annual_balance_update(1_000.0), 0.01
  end

  def test_annual_balance_update_for_large_positive_start_balance
    assert_in_delta 1_016.2_101_016_209_999, SavingsAccount.annual_balance_update(1_000.000_1), 0.000_000_000_001
  end

  def test_annual_balance_update_for_huge_positive_start_balance
    assert_in_delta 920_352_587.26_744_292_868_451_875,
      SavingsAccount.annual_balance_update(898_124_017.826_243_404_425), 0.000_000_000_000_000_01
  end

  def test_annual_balance_update_for_small_negative_start_balance
    assert_in_delta(-0.12_695_199, SavingsAccount.annual_balance_update(-0.123), 0.000_000_1)
  end

  def test_annual_balance_update_for_average_negative_start_balance
    assert_in_delta(-1_032.13, SavingsAccount.annual_balance_update(-1_000.0), 0.01)
  end

  def test_annual_balance_update_for_large_negative_start_balance
    assert_in_delta(-157_878.97_174_203, SavingsAccount.annual_balance_update(-152_964.231), 0.000_000_01)
  end

  def test_years_before_desired_balance_for_small_start_balance
    assert_equal 47, SavingsAccount.years_before_desired_balance(100.0, 125.8)
  end

  def test_years_before_desired_balance_for_average_start_balance
    assert_equal 6, SavingsAccount.years_before_desired_balance(1_000.0, 1_100.0)
  end

  def test_years_before_desired_balance_for_large_start_balance
    assert_equal 5, SavingsAccount.years_before_desired_balance(8_080.80, 9_090.9)
  end

  def test_years_before_desired_balance_for_large_difference_between_start_and_desired_balance
    assert_equal 85, SavingsAccount.years_before_desired_balance(2_345.67, 12_345.678_9)
  end
end
