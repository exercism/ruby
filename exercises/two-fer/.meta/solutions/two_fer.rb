module BookKeeping
  VERSION = 1
end

class TwoFer
  def self.two_fer(name=nil)
    if name == nil
      return "One for you, one for me."
    else
      return "One for #{name}, one for me."
    end
  end
end
