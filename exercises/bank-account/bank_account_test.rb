#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'bank_account'

class BankAccountTest < Minitest::Test
  def setup
    @bank_account = BankAccount.new
  end

  def test_account_has_balance
    assert @bank_account.respond_to?(:balance)
  end

  def test_account_has_status
    assert @bank_account.respond_to?(:status)
  end

  def test_initial_balance
    assert_equal 0, @bank_account.balance
  end

  def test_initial_status
    assert_equal 'open', @bank_account.status
  end

  def test_one_deposit
    @bank_account.deposit(420)
    assert_equal 420, @bank_account.balance
  end

  def test_multiple_deposits
    2.times { @bank_account.deposit(210) }
    assert_equal 420, @bank_account.balance
  end

  def test_positive_deposits
    @bank_account.deposit(420)
    @bank_account.deposit(-420)
    assert_equal 420, @bank_account.balance
  end

  def test_one_withdrawal
    @bank_account.deposit(421)
    @bank_account.withdraw(1)
    assert_equal 420, @bank_account.balance
  end

  def test_multiple_withdrawals
    @bank_account.deposit(422)
    2.times { @bank_account.withdraw(1) }
    assert_equal 420, @bank_account.balance
  end

  def test_positive_withdrawals
    @bank_account.deposit(420)
    @bank_account.withdraw(-420)
    assert_equal 420, @bank_account.balance
  end

  def test_cannot_overdraw
    @bank_account.deposit(420)
    @bank_account.withdraw(420_420)
    assert_equal 420, @bank_account.balance
  end

  def test_close_account
    @bank_account.close
    assert_equal 'closed', @bank_account.status
  end

  def test_account_must_have_zero_balance_to_close
    @bank_account.deposit(420)
    @bank_account.close
    assert_equal 'open', @bank_account.status
  end

  def test_cannot_deposit_to_closed_account
    @bank_account.close
    @bank_account.deposit(420)
    assert_equal 0, @bank_account.balance
  end

  def test_cannot_withdraw_from_closed_account
    @bank_account.close
    @bank_account.withdraw(420)
    assert_equal 0, @bank_account.balance
  end
end
