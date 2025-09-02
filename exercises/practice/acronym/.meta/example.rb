class Acronym
  def self.abbreviate(phrase)
    [].tap do |letters|
      each_word(phrase) do |word|
        letters << word[0].upcase
      end
    end.join
  end

  def self.each_word(phrase, &block)
    phrase.scan(/[A-Za-z]+(?:'[A-Za-z]+)*/, &block)
  end
end
