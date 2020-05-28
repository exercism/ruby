class Microwave
  attr_reader :minutes, :seconds

  def initialize(input)
    base = input > 99 ? 100 : 60

    @minutes = input / base
    @seconds = (input - minutes * base) % base
  end

  def timer
    "#{'%02i' % minutes}:#{'%02i' % seconds}"
  end
end
