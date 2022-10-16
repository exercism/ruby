require 'minitest/autorun'
require_relative 'scale_generator'

class ScaleGeneratorTest < Minitest::Test
  def test_chromatic_scales_chromatic_scale_with_sharps
    # skip
    scale = Scale.new("C")
    assert_equal ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"], scale.chromatic
  end

  def test_chromatic_scales_chromatic_scale_with_flats
    skip
    scale = Scale.new("F")
    assert_equal %w[F Gb G Ab A Bb B C Db D Eb E], scale.chromatic
  end

  def test_scales_with_specified_intervals_simple_major_scale
    skip
    scale = Scale.new("C")
    assert_equal %w[C D E F G A B], scale.interval("MMmMMMm")
  end

  def test_scales_with_specified_intervals_major_scale_with_sharps
    skip
    scale = Scale.new("G")
    assert_equal ["G", "A", "B", "C", "D", "E", "F#"], scale.interval("MMmMMMm")
  end

  def test_scales_with_specified_intervals_major_scale_with_flats
    skip
    scale = Scale.new("F")
    assert_equal %w[F G A Bb C D E], scale.interval("MMmMMMm")
  end

  def test_scales_with_specified_intervals_minor_scale_with_sharps
    skip
    scale = Scale.new("f#")
    assert_equal ["F#", "G#", "A", "B", "C#", "D", "E"], scale.interval("MmMMmMM")
  end

  def test_scales_with_specified_intervals_minor_scale_with_flats
    skip
    scale = Scale.new("bb")
    assert_equal %w[Bb C Db Eb F Gb Ab], scale.interval("MmMMmMM")
  end

  def test_scales_with_specified_intervals_dorian_mode
    skip
    scale = Scale.new("d")
    assert_equal %w[D E F G A B C], scale.interval("MmMMMmM")
  end

  def test_scales_with_specified_intervals_mixolydian_mode
    skip
    scale = Scale.new("Eb")
    assert_equal %w[Eb F G Ab Bb C Db], scale.interval("MMmMMmM")
  end

  def test_scales_with_specified_intervals_lydian_mode
    skip
    scale = Scale.new("a")
    assert_equal ["A", "B", "C#", "D#", "E", "F#", "G#"], scale.interval("MMMmMMm")
  end

  def test_scales_with_specified_intervals_phrygian_mode
    skip
    scale = Scale.new("e")
    assert_equal %w[E F G A B C D], scale.interval("mMMMmMM")
  end

  def test_scales_with_specified_intervals_locrian_mode
    skip
    scale = Scale.new("g")
    assert_equal %w[G Ab Bb C Db Eb F], scale.interval("mMMmMMM")
  end

  def test_scales_with_specified_intervals_harmonic_minor
    skip
    scale = Scale.new("d")
    assert_equal %w[D E F G A Bb Db], scale.interval("MmMMmAm")
  end

  def test_scales_with_specified_intervals_octatonic
    skip
    scale = Scale.new("C")
    assert_equal ["C", "D", "D#", "F", "F#", "G#", "A", "B"], scale.interval("MmMmMmMm")
  end

  def test_scales_with_specified_intervals_hexatonic
    skip
    scale = Scale.new("Db")
    assert_equal %w[Db Eb F G A B], scale.interval("MMMMMM")
  end

  def test_scales_with_specified_intervals_pentatonic
    skip
    scale = Scale.new("A")
    assert_equal ["A", "B", "C#", "E", "F#"], scale.interval("MMAMA")
  end

  def test_scales_with_specified_intervals_enigmatic
    skip
    scale = Scale.new("G")
    assert_equal ["G", "G#", "B", "C#", "D#", "F", "F#"], scale.interval("mAMMMmm")
  end
end
