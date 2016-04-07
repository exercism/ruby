class Pangram
  VERSION = 1

  def self.is_pangram?(str)
    downcased_str = str.downcase
    ('a'..'z').all? { |letter| downcased_str.include?(letter) }
  end
end
