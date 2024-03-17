require 'minitest/autorun'
require_relative 'zebra_puzzle'

class ZebraPuzzleTest < Minitest::Test
  def test_resident_who_drinks_water
    assert_equal ZebraPuzzle.water_drinker, "Norwegian"
  end

  def test_resident_who_owns_zebra
    assert_equal ZebraPuzzle.zebra_owner, "Japanese"
  end
end
