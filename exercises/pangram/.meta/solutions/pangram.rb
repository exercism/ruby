module BookKeeping
  VERSION = 5
end

class Pangram
  def self.pangram?(str)
    downcased_str = str.downcase
    ('a'..'z').all? { |letter| downcased_str.include?(letter) }
  end
end
