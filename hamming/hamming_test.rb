#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'hamming'

# Test data version:
# 11a7e6f Merge pull request #92 from kotp/116_Verbal_Word_Problem

class HammingTest < Minitest::Test
  def test_identical_strands
    assert_equal 0, Hamming.compute('A', 'A')
  end

  def test_long_identical_strands
    skip
    assert_equal 0, Hamming.compute('GGACTGA', 'GGACTGA')
  end

  def test_complete_distance_in_single_nucleotide_strands
    skip
    assert_equal 1, Hamming.compute('A', 'G')
  end

  def test_complete_distance_in_small_strands
    skip
    assert_equal 2, Hamming.compute('AG', 'CT')
  end

  def test_small_distance_in_small_strands
    skip
    assert_equal 1, Hamming.compute('AT', 'CT')
  end

  def test_small_distance
    skip
    assert_equal 1, Hamming.compute('GGACG', 'GGTCG')
  end

  def test_small_distance_in_long_strands
    skip
    assert_equal 2, Hamming.compute('ACCAGGG', 'ACTATGG')
  end

  def test_non_unique_character_in_first_strand
    skip
    assert_equal 1, Hamming.compute('AGA', 'AGG')
  end

  def test_non_unique_character_in_second_strand
    skip
    assert_equal 1, Hamming.compute('AGG', 'AGA')
  end

  def test_large_distance
    skip
    assert_equal 4, Hamming.compute('GATACA', 'GCATAA')
  end

  def test_large_distance_in_off_by_one_strand
    skip
    assert_equal 9, Hamming.compute('GGACGGATTCTG', 'AGGACGGATTCT')
  end

  def test_empty_strands
    skip
    assert_equal 0, Hamming.compute('', '')
  end

  def test_disallow_first_strand_longer
    skip
    assert_raises(ArgumentError) { Hamming.compute('AATG', 'AAA') }
  end

  def test_disallow_second_strand_longer
    skip
    assert_raises(ArgumentError) { Hamming.compute('ATA', 'AGTG') }
  end

  # This test is for the sake of people providing feedback, so they
  # know which version of the exercise you are solving.
  def test_bookkeeping
    skip
    assert_equal 1, Hamming::VERSION
  end
end
