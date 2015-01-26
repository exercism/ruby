class Gigasecond
  SECONDS = 10**9

  def self.from(time)
    (time.to_time + SECONDS).to_time
  end
end
