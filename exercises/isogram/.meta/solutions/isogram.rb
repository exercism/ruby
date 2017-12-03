module BookKeeping
  VERSION = 5
end

class Isogram
  def self.isogram?(str)
    letters = str.downcase.gsub(/[[:punct:]]| /, '').chars
    letters == letters.uniq
  end
end
