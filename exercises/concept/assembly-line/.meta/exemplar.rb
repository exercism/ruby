class AssemblyLine
  CARS_PER_SPEED = 221

  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    (@speed * CARS_PER_SPEED) * success_rate
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).floor
  end

  def success_rate
    return 0.77 if @speed == 10
    return 0.8 if @speed == 9
    return 0.9 if @speed >= 5
    1
  end
end
