class Isogram
  def self.isogram?(str)
    letters = str.downcase.gsub(/[[:punct:]]| /, '').chars
    letters == letters.uniq
  end
end
