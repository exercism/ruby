
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'example'

class DiamondTest < Minitest::Test

  def test_make_diamonds
    diamond_C = Diamond.new("C")
    output = capture_io do
      diamond_C.run
    end
    exp_diamond = "    A    \n  B   B  \nC       C\n  B   B  \n    A    \n"
    assert_equal(exp_diamond, output[0])
  end
end
