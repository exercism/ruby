class ParallelLetterFrequency
  def self.count(texts)
    return {} if texts.empty?

    ractor_count = [texts.length, 8].min
    batch_size = (texts.length.to_f / ractor_count).ceil
    ractors = texts.each_slice(batch_size).map do |batch|
      Ractor.new(batch) do |batch_texts|
        ascii_counts = Array.new(26, 0)
        tally = Hash.new(0)

        batch_texts.each do |text|
          if text.ascii_only?
            text.each_byte do |byte|
              case byte
              when 65..90 then ascii_counts[byte - 65] += 1
              when 97..122 then ascii_counts[byte - 97] += 1
              end
            end
          else
            text.downcase.each_grapheme_cluster do |cluster|
              tally[cluster] += 1 if cluster.match?(/\p{Alpha}/)
            end
          end
        end

        ascii_counts.each_with_index do |count, index|
          tally[(index + 97).chr] += count unless count.zero?
        end

        tally
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
