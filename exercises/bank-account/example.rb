class BankAccount

  attr_accessor :balance, :status

  def initialize
    @balance = 0
    @status  = "open"
  end

  def deposit(amount)
    if status == "open"
      self.balance += amount if amount > 0
    end
  end

  def withdraw(amount)
    self.balance -= amount if (amount > 0 && amount <= balance)
  end

  def close
    self.status = "closed" if balance == 0
  end

end