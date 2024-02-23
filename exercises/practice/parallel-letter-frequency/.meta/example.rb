class ParallelLetterFrequency
  def self.count(texts)
    ractors = (0...texts.length).map do |i|
      Ractor.new(texts[i]) do |text|
        text.downcase.each_grapheme_cluster.select do |cluster|
          cluster.match?(/\p{Alpha}/)
        end.tally
      end
    end

    tally = Hash.new(0)

    until ractors.empty?
      ractor, result = Ractor.select(*ractors)
      ractors.delete ractor
      result.each do |key, value|
        tally[key] += value
      end
    end

    tally
  end
end
