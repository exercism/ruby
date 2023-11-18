require 'minitest/autorun'
require_relative 'port_palermo'

class PortPalermoTest < Minitest::Test
  def test_identifier
    assert_equal :PALE, Port::IDENTIFIER
  end

  def test_get_identifier_for_hamburg
    assert_equal :HAMB, Port.get_identifier("Hamburg")
  end

  def test_get_identifier_for_rome
    assert_equal :ROME, Port.get_identifier("Rome")
  end

  def test_get_identifier_for_kiel
    assert_equal :KIEL, Port.get_identifier("Kiel")
  end

  def test_get_terminal_for_oil
    assert_equal :A, Port.get_terminal(:OIL123)
  end

  def test_get_terminal_for_gas
    assert_equal :A, Port.get_terminal(:GAS674)
  end

  def test_get_terminal_for_cars
    assert_equal :B, Port.get_terminal(:CAR942)
  end

  def test_get_terminal_for_clothes
    assert_equal :B, Port.get_terminal(:CLO315)
  end
end
