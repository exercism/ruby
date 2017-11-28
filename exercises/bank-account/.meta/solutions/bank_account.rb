module BookKeeping
  VERSION = 1
end

class BankAccount
  def initialize
    @balance = 0
    @closed = true
    @lock = Mutex.new
  end

  def open
    @closed = false
  end

  def close
    @closed = true
  end

  def balance
    closed?
    @balance
  end

  def deposit(amount)
    @lock.synchronize do
      closed?
      valid_amount?(amount)
      @balance += amount
    end
  end

  def withdraw(amount)
    @lock.synchronize do
      closed?
      valid_amount?(amount)
      enough_money_in_account?(amount)
      @balance -= amount
    end
  end

  private

  def closed?
    raise BankAccountActionInvalidError.new('Account closed') if @closed
  end

  def valid_amount?(amount)
    if amount < 0
      raise BankAccountActionInvalidError.new(
        'Cannot deposit or withdraw negative amount'
      )
    end
  end

  def enough_money_in_account?(amount)
    if @balance.zero?
      raise BankAccountActionInvalidError.new(
        'Cannot withdraw money from an empty account'
      )
    end
    if amount > @balance
      raise BankAccountActionInvalidError.new(
        'Cannot withdraw more money than is currently in the account'
      )
    end
  end
end

class BankAccountActionInvalidError < StandardError
  def initialize(msg)
    super
  end
end
