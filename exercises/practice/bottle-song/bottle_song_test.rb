require 'minitest/autorun'
require_relative 'bottle_song'

class BottleSongTest < Minitest::Test
  def test_single_verse
    # skip
    expected = <<~TEXT
      Ten green bottles hanging on the wall,
      Ten green bottles hanging on the wall,
      And if one green bottle should accidentally fall,
      There'll be nine green bottles hanging on the wall.
    TEXT
    assert_equal expected, BottleSong.recite(10, 1)
  end

  def test_last_generic_verse
    skip
    expected = <<~TEXT
      Three green bottles hanging on the wall,
      Three green bottles hanging on the wall,
      And if one green bottle should accidentally fall,
      There'll be two green bottles hanging on the wall.
    TEXT
    assert_equal expected, BottleSong.recite(3, 1)
  end

  def test_verse_with_2_bottles
    skip
    expected = <<~TEXT
      Two green bottles hanging on the wall,
      Two green bottles hanging on the wall,
      And if one green bottle should accidentally fall,
      There'll be one green bottle hanging on the wall.
    TEXT
    assert_equal expected, BottleSong.recite(2, 1)
  end

  def test_verse_with_1_bottle
    skip
    expected = <<~TEXT
      One green bottle hanging on the wall,
      One green bottle hanging on the wall,
      And if one green bottle should accidentally fall,
      There'll be no green bottles hanging on the wall.
    TEXT
    assert_equal expected, BottleSong.recite(1, 1)
  end

  def test_first_two_verses
    skip
    expected = <<~TEXT
      Ten green bottles hanging on the wall,
      Ten green bottles hanging on the wall,
      And if one green bottle should accidentally fall,
      There'll be nine green bottles hanging on the wall.

      Nine green bottles hanging on the wall,
      Nine green bottles hanging on the wall,
      And if one green bottle should accidentally fall,
      There'll be eight green bottles hanging on the wall.
    TEXT
    assert_equal expected, BottleSong.recite(10, 2)
  end

  def test_last_three_verses
    skip
    expected = <<~TEXT
      Three green bottles hanging on the wall,
      Three green bottles hanging on the wall,
      And if one green bottle should accidentally fall,
      There'll be two green bottles hanging on the wall.

      Two green bottles hanging on the wall,
      Two green bottles hanging on the wall,
      And if one green bottle should accidentally fall,
      There'll be one green bottle hanging on the wall.

      One green bottle hanging on the wall,
      One green bottle hanging on the wall,
      And if one green bottle should accidentally fall,
      There'll be no green bottles hanging on the wall.
    TEXT
    assert_equal expected, BottleSong.recite(3, 3)
  end

  def test_all_verses
    skip
    expected = <<~TEXT
      Ten green bottles hanging on the wall,
      Ten green bottles hanging on the wall,
      And if one green bottle should accidentally fall,
      There'll be nine green bottles hanging on the wall.

      Nine green bottles hanging on the wall,
      Nine green bottles hanging on the wall,
      And if one green bottle should accidentally fall,
      There'll be eight green bottles hanging on the wall.

      Eight green bottles hanging on the wall,
      Eight green bottles hanging on the wall,
      And if one green bottle should accidentally fall,
      There'll be seven green bottles hanging on the wall.

      Seven green bottles hanging on the wall,
      Seven green bottles hanging on the wall,
      And if one green bottle should accidentally fall,
      There'll be six green bottles hanging on the wall.

      Six green bottles hanging on the wall,
      Six green bottles hanging on the wall,
      And if one green bottle should accidentally fall,
      There'll be five green bottles hanging on the wall.

      Five green bottles hanging on the wall,
      Five green bottles hanging on the wall,
      And if one green bottle should accidentally fall,
      There'll be four green bottles hanging on the wall.

      Four green bottles hanging on the wall,
      Four green bottles hanging on the wall,
      And if one green bottle should accidentally fall,
      There'll be three green bottles hanging on the wall.

      Three green bottles hanging on the wall,
      Three green bottles hanging on the wall,
      And if one green bottle should accidentally fall,
      There'll be two green bottles hanging on the wall.

      Two green bottles hanging on the wall,
      Two green bottles hanging on the wall,
      And if one green bottle should accidentally fall,
      There'll be one green bottle hanging on the wall.

      One green bottle hanging on the wall,
      One green bottle hanging on the wall,
      And if one green bottle should accidentally fall,
      There'll be no green bottles hanging on the wall.
    TEXT
    assert_equal expected, BottleSong.recite(10, 10)
  end
end
