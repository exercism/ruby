class Microwave
  attr_reader :buttons_pressed, :minutes, :seconds

  def initialize(input)
    @buttons_pressed = input.join.to_i

    base = buttons_pressed > 99 ? 100 : 60

    @minutes = buttons_pressed / base
    @seconds = (buttons_pressed - (minutes * base)) % base
  end

  def timer
    "#{add_zeros(minutes.to_s)}:#{add_zeros(seconds.to_s)}"
  end

  private

  def add_zeros(time_str)
    time_str.length == 1 ? time_str.prepend('0') : time_str
  end
end
