module BookKeeping
  VERSION = 1
end

class TwoFer
  def self.getResponse(name)
    unless name.empty?
      sprintf("One for %s, one for me.", name)
    else
      "One for you, one for me."
    end
  end
end
