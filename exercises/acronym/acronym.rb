class Acronym
  def self.abbreviate(word)
    result = ""

    new_word = word.split(/[\s,-]/)

    new_word = new_word.reject { |element| element.empty? }

    new_word.each do |word|
      result << word.slice(0)
    end
    result.upcase
  end
end
