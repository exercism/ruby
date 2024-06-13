require 'minitest/autorun'
require 'minitest/benchmark'
require_relative 'parallel_letter_frequency'

class ParallelLetterFrequencyBenchmarkTest < Minitest::Benchmark
  def self.bench_range
    bench_exp(1, 100_000)
  end

  def setup
    @strings = {}
    self.class.bench_range.each do |n|
      @strings[n] = Array.new(10, 'a' * n)
    end
  end

  def bench_sequential
    assert_performance ->(_, _) { true } do |n|
      sequential_letter_frequency(@strings[n])
    end
  end

  def bench_parallel
    assert_performance ->(_, _) { true } do |n|
      ParallelLetterFrequency.count(@strings[n])
    end
  end

  def sequential_letter_frequency(texts)
    tally = Hash.new(0)
    texts.each do |text|
      text.each_grapheme_cluster do |cluster|
        tally[cluster] += 1
      end
    end

    tally
  end
end
