class SpaceAge
  attr_reader :seconds

  def initialize(seconds)
    @seconds = seconds
    @earth_yr_in_secs = 31_557_600.to_f
  end

  {
    earth: 1,
    mercury: 0.2408467,
    venus: 0.61519726,
    mars: 1.8808158,
    jupiter: 11.862615,
    saturn: 29.447498,
    uranus: 84.016846,
    neptune: 164.79132
  }.each do |planet, planet_in_earth_yrs|

    define_method("on_#{planet}") do
      seconds / (planet_in_earth_yrs * @earth_yr_in_secs)
    end
  end
end
