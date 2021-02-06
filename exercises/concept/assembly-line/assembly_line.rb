class AssemblyLine
  def self.production_rate_per_hour(speed)
    raise NotImplementedError, 'Please implement the AssemblyLine.production_rate_per_hour method'
  end

  def self.working_items_per_minute(speed)
    raise NotImplementedError, 'Please implement the AssemblyLine.working_items_per_minute method'
  end
end
