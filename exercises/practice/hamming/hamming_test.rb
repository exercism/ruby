require 'minitest/autorun'
require_relative 'hamming'

class HammingTest < Minitest::Test
  def test_empty_strands
    # skip
    assert_equal 0, Hamming.compute("", "")
  end

  def test_single_letter_identical_strands
    skip
    assert_equal 0, Hamming.compute("A", "A")
  end

  def test_single_letter_different_strands
    skip
    assert_equal 1, Hamming.compute("G", "T")
  end

  def test_long_identical_strands
    skip
    assert_equal 0, Hamming.compute("GGACTGAAATCTG", "GGACTGAAATCTG")
  end

  def test_long_different_strands
    skip
    assert_equal 9, Hamming.compute("GGACGGATTCTG", "AGGACGGATTCT")
  end

  def test_disallow_first_strand_longer
    skip
    assert_raises(ArgumentError) do
      Hamming.compute("AATG", "AAA")
    end
  end

  def test_disallow_second_strand_longer
    skip
    assert_raises(ArgumentError) do
      Hamming.compute("ATA", "AGTG")
    end
  end

  def test_disallow_empty_first_strand
    skip
    assert_raises(ArgumentError) do
      Hamming.compute("", "G")
    end
  end

  def test_disallow_empty_second_strand
    skip
    assert_raises(ArgumentError) do
      Hamming.compute("G", "")
    end
  end
end
