module BookKeeping
  VERSION = 3
end

# Clock without dates exercise
class Clock

  attr_reader :total_minutes
  def initialize(hour: 0, minute: 0)
    @total_minutes = hour * 60 + minute
  end

  def +(other)
    @total_minutes += other.total_minutes
    self
  end

  def -(other)
    @total_minutes -= other.total_minutes
    self
  end

  def ==(other)
    to_s == other.to_s
  end

  def to_s
    format '%02i:%02i', *time
  end

  private

  def time
    [hours_from(@total_minutes), just_minutes(@total_minutes)]
  end

  def hours_from(minutes)
    minutes / 60 % 24
  end

  def just_minutes(minutes)
    minutes % 60
  end
end
