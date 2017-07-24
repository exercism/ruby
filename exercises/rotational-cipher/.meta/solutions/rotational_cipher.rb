module BookKeeping
  VERSION = 1
end

class RotationalCipher
  SMALL_LETTERS_RANGE = (97..122)
  BIG_LETTERS_RANGE   = (65..90)
  ROTATION_MODIFIER   = 1

  attr_reader :text

  def initialize(text, key)
    @text      = text
    @shift_key = key
  end

  def self.rotate(text, key)
    new(text, key).rotate
  end

  def rotate
    text.split('').map { |char| shift_char(char) }.join
  end

  private

  def shift_char(char)
    shift_ascii(char.ord).chr
  end

  def shift_key
    @shift_key % 26
  end

  def shift_ascii(char_ascii)
    case char_ascii
    when SMALL_LETTERS_RANGE
      shift_within(char_ascii, SMALL_LETTERS_RANGE.min, SMALL_LETTERS_RANGE.max)
    when BIG_LETTERS_RANGE
      shift_within(char_ascii, BIG_LETTERS_RANGE.min, BIG_LETTERS_RANGE.max)
    else
      char_ascii
    end
  end

  def shift_within(char_ascii, lower_limit, upper_limit)
    shifted_ascii = char_ascii + shift_key

    return shifted_ascii if shifted_ascii <= upper_limit

    lower_limit + (shifted_ascii - upper_limit - ROTATION_MODIFIER)
  end
end
