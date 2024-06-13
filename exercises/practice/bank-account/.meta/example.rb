class BankAccount
  def initialize
    @balance = 0
    @status = false
  end

  def balance
    unless @status
      raise ArgumentError.new("You can't check the balance of a closed account")
    end
    @balance
  end

  def open
    if @status
      raise ArgumentError.new("You can't open an already open account")
    end
    @status = true
  end

  def close
    unless @status
      raise ArgumentError.new("You can't close an already closed account")
    end
    @balance = 0
    @status = false
  end

  def deposit(amount)
    if amount < 0
      raise ArgumentError.new("You can't deposit a negative amount")
    elsif !@status
      raise ArgumentError.new("You can't deposit money into a closed account")
    end
    @balance += amount
  end

  def withdraw(amount)
    if amount < 0
      raise ArgumentError.new("You can't withdraw a negative amount")
    elsif amount > @balance
      raise ArgumentError.new("You can't withdraw more than you have")
    elsif !@status
      raise ArgumentError.new("You can't withdraw money into a closed account")
    end
    @balance -= amount
  end
end
