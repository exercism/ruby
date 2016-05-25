module BookKeeping
  VERSION = 2
end

class Pangram
  def self.is_pangram?(str)
    downcased_str = str.downcase
    ('a'..'z').all? { |letter| downcased_str.include?(letter) }
  end
end
