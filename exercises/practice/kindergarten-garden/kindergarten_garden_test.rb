require 'minitest/autorun'
require_relative 'kindergarten_garden'

class GardenTest < Minitest::Test
  def test_alices_garden
    garden = Garden.new("RC\nGG")
    assert_equal %i[radishes clover grass grass], garden.alice
  end

  def test_different_garden_for_alice
    skip
    garden = Garden.new("VC\nRC")
    assert_equal %i[violets clover radishes clover], garden.alice
  end

  def test_bobs_garden
    skip
    garden = Garden.new("VVCG\nVVRC")
    assert_equal %i[clover grass radishes clover], garden.bob
  end

  def test_bob_and_charlies_gardens
    skip
    garden = Garden.new("VVCCGG\nVVCCGG")
    assert_equal %i[clover clover clover clover], garden.bob
    assert_equal %i[grass grass grass grass], garden.charlie
  end
end

class TestFullGarden < Minitest::Test
  def setup
    skip
    diagram = "VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV"
    @garden = Garden.new(diagram)
  end

  attr_reader :garden

  def test_alice
    skip
    assert_equal %i[violets radishes violets radishes], garden.alice
  end

  def test_bob
    skip
    assert_equal %i[clover grass clover clover], garden.bob
  end

  def test_charlie
    skip
    assert_equal %i[violets violets clover grass], garden.charlie
  end

  def test_david
    skip
    assert_equal %i[radishes violets clover radishes], garden.david
  end

  def test_eve
    skip
    assert_equal %i[clover grass radishes grass], garden.eve
  end

  def test_fred
    skip
    assert_equal %i[grass clover violets clover], garden.fred
  end

  def test_ginny
    skip
    assert_equal %i[clover grass grass clover], garden.ginny
  end

  def test_harriet
    skip
    assert_equal %i[violets radishes radishes violets], garden.harriet
  end

  def test_ileana
    skip
    assert_equal %i[grass clover violets clover], garden.ileana
  end

  def test_joseph
    skip
    assert_equal %i[violets clover violets grass], garden.joseph
  end

  def test_kincaid
    skip
    assert_equal %i[grass clover clover grass], garden.kincaid
  end

  def test_larry
    skip
    assert_equal %i[grass violets clover violets], garden.larry
  end
end

class DisorderedTest < Minitest::Test
  def setup
    skip
    diagram = "VCRRGVRG\nRVGCCGCV"
    students = %w[Samantha Patricia Xander Roger]
    @garden = Garden.new(diagram, students)
  end

  attr_reader :garden

  def test_patricia
    skip
    assert_equal %i[violets clover radishes violets], garden.patricia
  end

  def test_roger
    skip
    assert_equal %i[radishes radishes grass clover], garden.roger
  end

  def test_samantha
    skip
    assert_equal %i[grass violets clover grass], garden.samantha
  end

  def test_xander
    skip
    assert_equal %i[radishes grass clover violets], garden.xander
  end
end

class TwoGardensDifferentStudents < Minitest::Test
  def diagram
    "VCRRGVRG\nRVGCCGCV"
  end

  def garden1
    @garden1 ||= Garden.new(diagram, %w[Alice Bob Charlie Dan])
  end

  def garden2
    @garden2 ||= Garden.new(diagram, %w[Bob Charlie Dan Erin])
  end

  def test_bob_and_charlie_per_garden
    skip
    assert_equal %i[radishes radishes grass clover], garden1.bob
    assert_equal %i[violets clover radishes violets], garden2.bob
    assert_equal %i[grass violets clover grass], garden1.charlie
    assert_equal %i[radishes radishes grass clover], garden2.charlie
  end
end
