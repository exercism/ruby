class Microwave
  attr_reader :minutes, :seconds

  def initialize(digits)
    @minutes, @seconds = digits.divmod(100)
    if @seconds >= 60
      @seconds -= 60
      @minutes += 1
    end
  end

  def timer
    '%02<minutes>i:%02<seconds>i' % {minutes: minutes, seconds: seconds}
  end
end
