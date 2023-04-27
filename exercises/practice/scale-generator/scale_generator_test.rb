require 'minitest/autorun'
require_relative 'scale_generator'

class ScaleGeneratorTest < Minitest::Test
  def test_chromatic_scales_chromatic_scale_with_sharps
    # skip
    scale = Scale.new("C")
    expected = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]
    assert_equal expected, scale.chromatic
  end

  def test_chromatic_scales_chromatic_scale_with_flats
    skip
    scale = Scale.new("F")
    expected = %w[F Gb G Ab A Bb B C Db D Eb E]
    assert_equal expected, scale.chromatic
  end

  def test_scales_with_specified_intervals_simple_major_scale
    skip
    scale = Scale.new("C")
    expected = %w[C D E F G A B C]
    assert_equal expected, scale.interval("MMmMMMm")
  end

  def test_scales_with_specified_intervals_major_scale_with_sharps
    skip
    scale = Scale.new("G")
    expected = ["G", "A", "B", "C", "D", "E", "F#", "G"]
    assert_equal expected, scale.interval("MMmMMMm")
  end

  def test_scales_with_specified_intervals_major_scale_with_flats
    skip
    scale = Scale.new("F")
    expected = %w[F G A Bb C D E F]
    assert_equal expected, scale.interval("MMmMMMm")
  end

  def test_scales_with_specified_intervals_minor_scale_with_sharps
    skip
    scale = Scale.new("f#")
    expected = ["F#", "G#", "A", "B", "C#", "D", "E", "F#"]
    assert_equal expected, scale.interval("MmMMmMM")
  end

  def test_scales_with_specified_intervals_minor_scale_with_flats
    skip
    scale = Scale.new("bb")
    expected = %w[Bb C Db Eb F Gb Ab Bb]
    assert_equal expected, scale.interval("MmMMmMM")
  end

  def test_scales_with_specified_intervals_dorian_mode
    skip
    scale = Scale.new("d")
    expected = %w[D E F G A B C D]
    assert_equal expected, scale.interval("MmMMMmM")
  end

  def test_scales_with_specified_intervals_mixolydian_mode
    skip
    scale = Scale.new("Eb")
    expected = %w[Eb F G Ab Bb C Db Eb]
    assert_equal expected, scale.interval("MMmMMmM")
  end

  def test_scales_with_specified_intervals_lydian_mode
    skip
    scale = Scale.new("a")
    expected = ["A", "B", "C#", "D#", "E", "F#", "G#", "A"]
    assert_equal expected, scale.interval("MMMmMMm")
  end

  def test_scales_with_specified_intervals_phrygian_mode
    skip
    scale = Scale.new("e")
    expected = %w[E F G A B C D E]
    assert_equal expected, scale.interval("mMMMmMM")
  end

  def test_scales_with_specified_intervals_locrian_mode
    skip
    scale = Scale.new("g")
    expected = %w[G Ab Bb C Db Eb F G]
    assert_equal expected, scale.interval("mMMmMMM")
  end

  def test_scales_with_specified_intervals_harmonic_minor
    skip
    scale = Scale.new("d")
    expected = %w[D E F G A Bb Db D]
    assert_equal expected, scale.interval("MmMMmAm")
  end

  def test_scales_with_specified_intervals_octatonic
    skip
    scale = Scale.new("C")
    expected = ["C", "D", "D#", "F", "F#", "G#", "A", "B", "C"]
    assert_equal expected, scale.interval("MmMmMmMm")
  end

  def test_scales_with_specified_intervals_hexatonic
    skip
    scale = Scale.new("Db")
    expected = %w[Db Eb F G A B Db]
    assert_equal expected, scale.interval("MMMMMM")
  end

  def test_scales_with_specified_intervals_pentatonic
    skip
    scale = Scale.new("A")
    expected = ["A", "B", "C#", "E", "F#", "A"]
    assert_equal expected, scale.interval("MMAMA")
  end

  def test_scales_with_specified_intervals_enigmatic
    skip
    scale = Scale.new("G")
    expected = ["G", "G#", "B", "C#", "D#", "F", "F#", "G"]
    assert_equal expected, scale.interval("mAMMMmm")
  end
end
