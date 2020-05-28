class Microwave
  attr_reader :minutes, :seconds

  def initialize(digits)
    base = digits > 99 ? 100 : 60

    @minutes = digits / base
    @seconds = (digits - minutes * base) % base
  end

  def timer
    "#{'%02i' % minutes}:#{'%02i' % seconds}"
  end
end
