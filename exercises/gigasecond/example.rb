module BookKeeping
  VERSION = 5
end

class Gigasecond
  SECONDS = 10**9

  def self.from(seconds)
    seconds + SECONDS
  end
end
