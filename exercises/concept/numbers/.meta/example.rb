class AssemblyLine

  CARS_PER_HOUR = 221
  MINUTES_IN_HOUR = 60
  # Success rates
  ONE_TO_FOUR_RATE = 1.00
  FIVE_TO_EIGHT_RATE = 0.90
  NINE_RATE = 0.80
  TEN_RATE = 0.77

  def self.production_rate_per_hour(speed)
    CARS_PER_HOUR * speed * success_rate(speed)
  end

  def self.working_items_per_minute(speed)
    (production_rate_per_hour(speed) / MINUTES_IN_HOUR).to_i
  end

  def self.success_rate(speed)
    if speed <= 4
      ONE_TO_FOUR_RATE
    elsif speed <= 8
      FIVE_TO_EIGHT_RATE
    elsif speed <= 9
      NINE_RATE
    else
      TEN_RATE
    end
  end
end
