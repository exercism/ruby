module BookKeeping
  VERSION = 2
end

# Clock without dates exercise
class Clock

  attr_reader :internal
  def initialize(hour: 0, minute: 0)
    @internal = hour * 60 + minute
  end

  def +(other)
    @internal += other.internal
  end

  def -(other)
    @internal += other.internal
  end

  def ==(other)
    to_s == other.to_s
  end

  def to_s
    format '%02i:%02i', *time
  end

  private

  def time
    [hours_from(@internal), just_minutes(@internal)]
  end

  def hours_from(minutes)
    minutes / 60 % 24
  end

  def just_minutes(minutes)
    minutes % 60
  end
end
