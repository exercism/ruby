module BookKeeping
  VERSION = 2
end

# Clock without dates exercise
class Clock
  def self.at(*args)
    Clock.new(*args)
  end

  def initialize(hours=0, minutes=0)
    @internal = hours * 60 + minutes
  end

  def +(hours=0, minutes)
    @internal += hours * 60 + minutes
    self
  end

  def -(*args)
    self.+(*args.map(&:-@))
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
