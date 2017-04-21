class Luhn
  DOUBLE = [0, 2, 4, 6, 8, 1, 3, 5, 7, 9]
  DOUBLE.freeze

  def self.valid?(string)
    Luhn.new(string).valid?
  end

  def initialize(string)
    @string = string.tr(' ', '')
  end

  def checksum
    @string.
      reverse.each_char.with_index.
      sum {|c, i| i.odd? ? DOUBLE[c.to_i] : c.to_i }
  end

  def valid?
    clean? && checksum_mod_10.zero?
  end

  def clean?
    @string.match(/^\d{2,}$/)
  end

  def checksum_mod_10
    checksum % 10
  end
end
module BookKeeping
  VERSION = 1
end

