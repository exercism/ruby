class Acronym
  def self.abbreviate(phrase)
    [].tap do |letters|
      each_word(phrase) do |word|
        letters << word[0].upcase
      end
    end.join
  end

  def self.each_word(phrase)
    phrase.scan(/[A-Z]+[a-z]*|[a-z]+/) do |word|
      yield word
    end
  end
end
