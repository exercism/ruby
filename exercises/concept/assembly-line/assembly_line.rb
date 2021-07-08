class AssemblyLine
  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    raise 'Please implement the AssemblyLine#production_rate_per_hour method'
  end

  def working_items_per_minute
    raise 'Please implement the AssemblyLine#working_items_per_minute method'
  end
end
