class Microwave
  attr_reader :buttons_pressed, :minutes, :seconds

  def initialize(input)
    @buttons_pressed = input.join.to_i

    base = buttons_pressed > 99 ? 100 : 60

    @minutes = buttons_pressed / base
    @seconds = (buttons_pressed - (minutes * base)) % base
  end

  def timer
    "#{prepend_zero(minutes.to_s)}:#{prepend_zero(seconds.to_s)}"
  end

  private

  def prepend_zero(time_str)
    time_str.length == 1 ? time_str.prepend('0') : time_str
  end
end
