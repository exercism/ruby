class SpaceAge
  attr_reader :seconds

  def initialize(seconds)
    @seconds = seconds
  end

  {
    mercury: 7_600_530.24,
    venus: 19_413_907.2,
    earth: 31_558_149.76,
    mars: 59_354_294.4,
    jupiter: 374_335_776.0,
    saturn: 929_596_608.0,
    uranus: 2_661_041_808.0,
    neptune: 5_200_418_592.0
  }.each do |planet, orbital_period|

    define_method("on_#{planet}") do
      seconds / orbital_period
    end

  end
end
