module BookKeeping
  VERSION = 4
end

class Gigasecond
  SECONDS = 10**9

  def self.from(seconds)
    seconds + SECONDS
  end
end
