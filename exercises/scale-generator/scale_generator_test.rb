#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'scale_generator'

class ScaleGeneratorTest < Minitest::Test
  def test_naming_scale
    chromatic = Scale.new('c', :chromatic)
    expected = 'C chromatic'
    actual = chromatic.name
    assert_equal expected, actual
  end

  def test_chromatic_scale
    skip
    chromatic = Scale.new('C', :chromatic)
    expected = %w(C C# D D# E F F# G G# A A# B)
    actual = chromatic.pitches
    assert_equal expected, actual
  end

  def test_another_chromatic_scale
    skip
    chromatic = Scale.new('F', :chromatic)
    expected = %w(F Gb G Ab A Bb B C Db D Eb E)
    actual = chromatic.pitches
    assert_equal expected, actual
  end

  def test_naming_major_scale
    skip
    major = Scale.new('G', :major, 'MMmMMMm')
    expected = 'G major'
    actual = major.name
    assert_equal expected, actual
  end

  def test_major_scale
    skip
    major = Scale.new('C', :major, 'MMmMMMm')
    expected = %w(C D E F G A B)
    actual = major.pitches
    assert_equal expected, actual
  end

  def test_another_major_scale
    skip
    major = Scale.new('G', :major, 'MMmMMMm')
    expected = %w(G A B C D E F#)
    actual = major.pitches
    assert_equal expected, actual
  end

  def test_minor_scale
    skip
    minor = Scale.new('f#', :minor, 'MmMMmMM')
    expected = %w(F# G# A B C# D E)
    actual = minor.pitches
    assert_equal expected, actual
  end

  def test_another_minor_scale
    skip
    minor = Scale.new('bb', :minor, 'MmMMmMM')
    expected = %w(Bb C Db Eb F Gb Ab)
    actual = minor.pitches
    assert_equal expected, actual
  end

  def test_dorian_mode
    skip
    dorian = Scale.new('d', :dorian, 'MmMMMmM')
    expected = %w(D E F G A B C)
    actual = dorian.pitches
    assert_equal expected, actual
  end

  def test_mixolydian_mode
    skip
    mixolydian = Scale.new('Eb', :mixolydian, 'MMmMMmM')
    expected = %w(Eb F G Ab Bb C Db)
    actual = mixolydian.pitches
    assert_equal expected, actual
  end

  def test_lydian_mode
    skip
    lydian = Scale.new('a', :lydian, 'MMMmMMm')
    expected = %w(A B C# D# E F# G#)
    actual = lydian.pitches
    assert_equal expected, actual
  end

  def test_phrygian_mode
    skip
    phrygian = Scale.new('e', :phrygian, 'mMMMmMM')
    expected = %w(E F G A B C D)
    actual = phrygian.pitches
    assert_equal expected, actual
  end

  def test_locrian_mode
    skip
    locrian = Scale.new('g', :locrian, 'mMMmMMM')
    expected = %w(G Ab Bb C Db Eb F)
    actual = locrian.pitches
    assert_equal expected, actual
  end

  def test_harmonic_minor
    skip
    harmonic_minor = Scale.new('d', :harmonic_minor, 'MmMMmAm')
    expected = %w(D E F G A Bb Db)
    actual = harmonic_minor.pitches
    assert_equal expected, actual
  end

  def test_octatonic
    skip
    octatonic = Scale.new('C', :octatonic, 'MmMmMmMm')
    expected = %w(C D D# F F# G# A B)
    actual = octatonic.pitches
    assert_equal expected, actual
  end

  def test_hexatonic
    skip
    hexatonic = Scale.new('Db', :hexatonic, 'MMMMMM')
    expected = %w(Db Eb F G A B)
    actual = hexatonic.pitches
    assert_equal expected, actual
  end

  def test_pentatonic
    skip
    pentatonic = Scale.new('A', :pentatonic, 'MMAMA')
    expected = %w(A B C# E F#)
    actual = pentatonic.pitches
    assert_equal expected, actual
  end

  def test_enigmatic
    skip
    enigmatic = Scale.new('G', :enigma, 'mAMMMmM')
    expected = %w(G G# B C# D# F F#)
    actual = enigmatic.pitches
    assert_equal expected, actual
  end

  # Problems in exercism evolve over time, as we find better ways to ask
  # questions.
  # The version number refers to the version of the problem you solved,
  # not your solution.
  #
  # Define a constant named VERSION inside of the top level BookKeeping
  # module, which may be placed near the end of your file.
  #
  # In your file, it will look like this:
  #
  # module BookKeeping
  #   VERSION = 1 # Where the version number matches the one in the test.
  # end
  #
  # If you are curious, read more about constants on RubyDoc:
  # http://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/constants.html

  def test_bookkeeping
    skip
    assert_equal 1, BookKeeping::VERSION
  end
end
