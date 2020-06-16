class BirdCount
  def self.lastWeek
    raise NotImplementedError, 'Please implement the BirdCount.lastWeek method'
  end

  def initialize(birds_per_day)
    raise NotImplementedError, 'Please implement the BirdCount#initialize method'
  end

  def yesterday
    raise NotImplementedError, 'Please implement the BirdCount#yesterday method'
  end

  def total
    raise NotImplementedError, 'Please implement the BirdCount#total method'
  end

  def busy_days
    raise NotImplementedError, 'Please implement the BirdCount#busy_days method'
  end

  def day_without_birds?
    raise NotImplementedError, 'Please implement the BirdCount#day_without_birds method'
  end
end

