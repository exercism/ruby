class OcrNumbers
  DIGITS = {
    ' _ | ||_|   ' => '0',
    '     |  |   ' => '1',
    ' _  _||_    ' => '2',
    ' _  _| _|   ' => '3',
    '   |_|  |   ' => '4',
    ' _ |_  _|   ' => '5',
    ' _ |_ |_|   ' => '6',
    ' _   |  |   ' => '7',
    ' _ |_||_|   ' => '8',
    ' _ |_| _|   ' => '9'
  }
  DIGITS.default = '?'

  def self.convert(text)
    OcrNumbers.new(text).convert
  end

  def initialize(text)
    @text = text
  end

  def convert
    raise ArgumentError unless valid?

    numbers.map {|lines| decode(lines) }.join(',')
  end

  private
  attr_reader :text

  def valid?
    (rows.size % 4).zero? &&
      (first_row_width % 3).zero? &&
      rows[1..-1].all? {|row| row.size == first_row_width }
  end

  def decode(lines)
    lines.map {|line| line.scan(/.../) }.
      transpose.
      map {|char_rows| DIGITS[char_rows.join] }.
      join
  end

  def numbers
    text.split("\n").each_slice(4)
  end

  def rows
    @rows ||= text.split("\n")
  end

  def first_row_width
    @first_row_width ||= rows.first.size
  end
end
