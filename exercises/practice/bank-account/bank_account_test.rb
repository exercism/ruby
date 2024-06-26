require 'minitest/autorun'
require_relative 'bank_account'

class BankAccountTest < Minitest::Test
  def test_newly_opened_account_has_zero_balance
    # skip
    bank_account = BankAccount.new
    bank_account.open
    assert_equal bank_account.balance, 0
  end

  def test_single_deposit
    skip
    bank_account = BankAccount.new
    bank_account.open
    bank_account.deposit(100)
    assert_equal 100, bank_account.balance
  end

  def test_multiple_deposits
    skip
    bank_account = BankAccount.new
    bank_account.open
    bank_account.deposit(100)
    bank_account.deposit(50)
    assert_equal 150, bank_account.balance
  end

  def test_withdraw_once
    skip
    bank_account = BankAccount.new
    bank_account.open
    bank_account.deposit(100)
    bank_account.withdraw(75)
    assert_equal 25, bank_account.balance
  end

  def test_withdraw_twice
    skip
    bank_account = BankAccount.new
    bank_account.open
    bank_account.deposit(100)
    bank_account.withdraw(80)
    bank_account.withdraw(20)
    assert_equal 0, bank_account.balance
  end

  def test_can_do_multiple_operations_sequentially
    skip
    bank_account = BankAccount.new
    bank_account.open
    bank_account.deposit(100)
    bank_account.deposit(110)
    bank_account.withdraw(200)
    bank_account.deposit(60)
    bank_account.withdraw(50)
    assert_equal 20, bank_account.balance
  end

  def test_cannot_check_balance_of_closed_account
    skip
    bank_account = BankAccount.new
    bank_account.open
    bank_account.close
    assert_raises(ArgumentError, "You can't check the balance of a closed account") { bank_account.balance }
  end

  def test_cannot_deposit_into_closed_account
    skip
    bank_account = BankAccount.new
    bank_account.open
    bank_account.close
    assert_raises(ArgumentError, "You can't deposit money into a closed account") { bank_account.deposit(50) }
  end

  def test_cannot_deposit_into_unopened_account
    skip
    bank_account = BankAccount.new
    assert_raises(ArgumentError, "You can't deposit money into a closed account") { bank_account.deposit(50) }
  end

  def test_cannot_withdraw_from_closed_account
    skip
    bank_account = BankAccount.new
    bank_account.open
    bank_account.close
    assert_raises(ArgumentError, "You can't withdraw money into a closed account") { bank_account.withdraw(50) }
  end

  def test_cannot_close_an_account_that_was_not_opened
    skip
    bank_account = BankAccount.new
    assert_raises(ArgumentError, "You can't close an already closed account") { bank_account.close }
  end

  def test_cannot_open_an_already_opened_account
    skip
    bank_account = BankAccount.new
    bank_account.open
    assert_raises(ArgumentError, "You can't open an already open account") { bank_account.open }
  end

  def test_reopened_account_does_not_retain_balance
    skip
    bank_account = BankAccount.new
    bank_account.open
    bank_account.deposit(50)
    bank_account.close
    bank_account.open
    assert_equal 0, bank_account.balance
  end

  def test_cannot_withdraw_more_than_deposited
    skip
    bank_account = BankAccount.new
    bank_account.open
    bank_account.deposit(25)
    assert_raises(ArgumentError, "You can't withdraw more than you have") { bank_account.withdraw(50) }
  end

  def test_cannot_withdraw_negative
    skip
    bank_account = BankAccount.new
    bank_account.open
    bank_account.deposit(100)
    assert_raises(ArgumentError, "You can't withdraw a negative amount") { bank_account.withdraw(-50) }
  end

  def test_cannot_deposit_negative
    skip
    bank_account = BankAccount.new
    bank_account.open
    assert_raises(ArgumentError, "You can't deposit a negative amount") { bank_account.deposit(-50) }
  end
end
