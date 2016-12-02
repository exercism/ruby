module BookKeeping
  VERSION = 2
end

class Isogram
  def self.is_isogram?(str)
    letters = str.downcase.gsub(/[[:punct:]]| /, '').chars
    letters == letters.uniq
  end
end
