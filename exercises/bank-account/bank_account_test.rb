require 'minitest/autorun'
require_relative 'bank_account'

class BankAccountTest < Minitest::Test
  attr_reader :bank_account

  def setup
    @bank_account = BankAccount.new
  end

  def test_newly_opened_account_has_empty_balance
    bank_account.open
    assert_equal 0, bank_account.balance
  end

  def test_can_deposit_money
    bank_account.open
    bank_account.deposit(10)
    assert_equal 10, bank_account.balance
  end

  def test_can_deposit_money_sequentially
    bank_account.open
    bank_account.deposit(5)
    bank_account.deposit(23)
    assert_equal 28, bank_account.balance
  end

  def test_can_withdraw_money
    bank_account.open
    bank_account.deposit(10)
    bank_account.withdraw(5)
    assert_equal 5, bank_account.balance
  end

  def test_can_withdraw_money_sequentially
    bank_account.open
    bank_account.deposit(23)
    bank_account.withdraw(10)
    bank_account.withdraw(13)
    assert_equal 0, bank_account.balance
  end

  def test_cannot_withdraw_money_from_empty_account
    bank_account.open
    err = assert_raises(BankAccountActionInvalidError) do
      bank_account.withdraw(5)
    end
    assert_equal 'Cannot withdraw money from an empty account', err.message
  end

  def test_cannot_withdraw_more_money_than_you_have
    bank_account.open
    bank_account.deposit(6)
    err = assert_raises(BankAccountActionInvalidError) do
      bank_account.withdraw(7)
    end
    assert_equal(
      'Cannot withdraw more money than is currently in the account',
      err.message
    )
  end

  def test_cannot_deposit_negative_amount
    bank_account.open
    err = assert_raises(BankAccountActionInvalidError) do
      bank_account.deposit(-1)
    end
    assert_equal 'Cannot deposit or withdraw negative amount', err.message
  end

  def test_cannot_withdraw_negative_amount
    bank_account.open
    err = assert_raises(BankAccountActionInvalidError) do
      bank_account.withdraw(-5)
    end
    assert_equal 'Cannot deposit or withdraw negative amount', err.message
  end

  def test_cannot_get_balance_of_closed_account
    bank_account.open
    bank_account.deposit(10)
    bank_account.close
    err = assert_raises(BankAccountActionInvalidError) do
      bank_account.balance
    end
    assert_equal 'Account closed', err.message
  end

  def test_cannot_deposit_money_into_closed_account
    bank_account.open
    bank_account.close
    err = assert_raises(BankAccountActionInvalidError) do
      bank_account.deposit(5)
    end
    assert_equal 'Account closed', err.message
  end

  def test_cannot_withdraw_money_from_closed_account
    bank_account.open
    bank_account.deposit(20)
    bank_account.close
    err = assert_raises(BankAccountActionInvalidError) do
      bank_account.withdraw(5)
    end
    assert_equal 'Account closed', err.message
  end

  def test_bank_account_is_closed_before_it_is_open
    err = assert_raises(BankAccountActionInvalidError) do
      bank_account.balance
    end
    assert_equal 'Account closed', err.message
  end

  def test_can_adjust_balance_concurrently
    bank_account.open
    bank_account.deposit(1000)

    10.times { adjust_balance_concurrently }
  end

  def adjust_balance_concurrently
    threads = Array.new(1000).map do
      Thread.new do
        bank_account.deposit(5)
        sleep(Random.rand(1..10) / 1000)
        bank_account.withdraw(5)
      end
    end

    threads.each(&:join)
    assert_equal 1000, bank_account.balance
  end

  # Problems in exercism evolve over time, as we find better ways to ask
  # questions.
  # The version number refers to the version of the problem you solved,
  # not your solution.
  #
  # Define a constant named VERSION inside of the top level BookKeeping
  # module.
  #  In your file, it will look like this:
  #
  # module BookKeeping
  #   VERSION = 1 # Where the version number matches the one in the test.
  # end
  #
  # If you are curious, read more about constants on RubyDoc:
  # http://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/constants.html

  def test_bookkeeping
    assert_equal 1, BookKeeping::VERSION
  end
end
