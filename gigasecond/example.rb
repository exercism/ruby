class Gigasecond
  SECONDS = 10**9

  def self.from(date)
    (date.to_time + SECONDS).to_date
  end
end

