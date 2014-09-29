class Board
  VALID_BORDERS = ["+", "-", "|"]
  VALID_DATA = ["*", "|", "+", "-", " "]

  def self.transform(input)
    new(input).transform
  end

  def initialize(raw_board)
    @rows = raw_board
    validate
  end

  def transform
    printout = []
    rows.each_with_index do |row, i|
      inner = []
      row.each_char.with_index do |space, j|
        if space != " "
          inner << space
        else
          k = 0
          surroundings = [
            row[j -1], row[j + 1], rows[i - 1][j - 1],
            rows[i - 1][j], rows[i - 1][j + 1],
            rows[i + 1][j - 1], rows[i + 1][j], rows[i + 1][j + 1]
          ]
          surroundings.each do |datum|
            if datum == "*"
              k += 1
            end
          end
          if k > 0
            inner << k.to_s
          else
            inner << space
          end
        end
      end
      printout << inner.join
    end
    printout
  end

  private

  attr_reader :rows

  def validate
    validate_size
    validate_borders
    validate_data
  end

  def validate_size
    len = rows.first.length
    if rows.any? { |row| row.length != len }
      raise ValueError, "Invalid board"
    end
  end

  def validate_borders
    [rows[0], rows[-1]].each do |row|
      invalid = row.chars.any? do |char|
        !VALID_BORDERS.include?(char)
      end
      raise ValueError, "Invalid board" if invalid
    end
  end

  def validate_data
    rows.each do |row|
      invalid = row.chars.any? do |char|
        !VALID_DATA.include?(char)
      end
      raise ValueError, "Invalid board" if invalid
    end
  end
end

ValueError = Class.new(StandardError)
