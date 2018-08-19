class Hamming
  def self.compute(strand1, strand2)
    strand1.length == strand2.length ||
      fail(ArgumentError, 'The two strands must have the same length.')
    (0...strand1.length).count do |i|
      strand1[i] != strand2[i]
    end
  end
end
