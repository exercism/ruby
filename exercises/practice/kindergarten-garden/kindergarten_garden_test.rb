require 'minitest/autorun'
require_relative 'kindergarten_garden'

class KindergartenGardenTest < Minitest::Test
  def test_garden_with_single_student
    # skip
    garden = Garden.new("RC\nGG")
    assert_equal %i[radishes clover grass grass], garden.alice
  end

  def test_different_garden_with_single_student
    skip
    garden = Garden.new("VC\nRC")
    assert_equal %i[violets clover radishes clover], garden.alice
  end

  def test_garden_with_two_students
    skip
    garden = Garden.new("VVCG\nVVRC")
    assert_equal %i[clover grass radishes clover], garden.bob
  end

  def test_second_students_garden
    skip
    garden = Garden.new("VVCCGG\nVVCCGG")
    assert_equal %i[clover clover clover clover], garden.bob
  end

  def test_third_students_garden
    skip
    garden = Garden.new("VVCCGG\nVVCCGG")
    assert_equal %i[grass grass grass grass], garden.charlie
  end

  def test_for_alice_first_students_garden
    skip
    garden = Garden.new("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
    assert_equal %i[violets radishes violets radishes], garden.alice
  end

  def test_for_bob_second_students_garden
    skip
    garden = Garden.new("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
    assert_equal %i[clover grass clover clover], garden.bob
  end

  def test_for_charlie
    skip
    garden = Garden.new("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
    assert_equal %i[violets violets clover grass], garden.charlie
  end

  def test_for_david
    skip
    garden = Garden.new("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
    assert_equal %i[radishes violets clover radishes], garden.david
  end

  def test_for_eve
    skip
    garden = Garden.new("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
    assert_equal %i[clover grass radishes grass], garden.eve
  end

  def test_for_fred
    skip
    garden = Garden.new("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
    assert_equal %i[grass clover violets clover], garden.fred
  end

  def test_for_ginny
    skip
    garden = Garden.new("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
    assert_equal %i[clover grass grass clover], garden.ginny
  end

  def test_for_harriet
    skip
    garden = Garden.new("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
    assert_equal %i[violets radishes radishes violets], garden.harriet
  end

  def test_for_ileana
    skip
    garden = Garden.new("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
    assert_equal %i[grass clover violets clover], garden.ileana
  end

  def test_for_joseph
    skip
    garden = Garden.new("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
    assert_equal %i[violets clover violets grass], garden.joseph
  end

  def test_for_kincaid_second_to_last_students_garden
    skip
    garden = Garden.new("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
    assert_equal %i[grass clover clover grass], garden.kincaid
  end

  def test_for_larry_last_students_garden
    skip
    garden = Garden.new("VRCGVVRVCGGCCGVRGCVCGCGV\nVRCCCGCRRGVCGCRVVCVGCGCV")
    assert_equal %i[grass violets clover violets], garden.larry
  end
end
