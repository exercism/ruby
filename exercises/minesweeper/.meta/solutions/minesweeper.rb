class Board
  VALID_BORDERS = ['+', '-', '|']
  VALID_DATA = ['*', '|', '+', '-', ' ']

  def self.transform(input)
    new(input).transform
  end

  def initialize(raw_board)
    @rows = raw_board
    validate
  end

  def transform
    rows.map.with_index do |row, i|
      decorate_row(row, i)
    end
  end

  def mine?(char)
    char == '*'
  end

  private

  attr_reader :rows

  def decorate_row(row, i)
    inner = []
    row.each_char.with_index do |space, j|
      if space != ' '
        inner << space
      else
        surroundings = surroundings(row, i, j)
        k = count_mines_nearby(surroundings)
        if k > 0
          inner << k.to_s
        else
          inner << space
        end
      end
    end
    inner.join
  end

  def surroundings(row, i, j)
    [
      row[j - 1], row[j + 1], rows[i - 1][j - 1],
      rows[i - 1][j], rows[i - 1][j + 1],
      rows[i + 1][j - 1], rows[i + 1][j], rows[i + 1][j + 1]
    ]
  end

  def count_mines_nearby(surroundings)
    surroundings.count { |datum| mine?(datum) }
  end

  def validate
    validate_size
    validate_borders
    validate_data
  end

  def validate_size
    len = rows.first.length
    if rows.any? { |row| row.length != len }
      fail ValueError, 'Invalid board'
    end
  end

  def validate_borders
    [rows[0], rows[-1]].each do |row|
      invalid = row.chars.any? do |char|
        !VALID_BORDERS.include?(char)
      end
      fail ValueError, 'Invalid board' if invalid
    end
  end

  def validate_data
    rows.each do |row|
      invalid = row.chars.any? do |char|
        !VALID_DATA.include?(char)
      end
      fail ValueError, 'Invalid board' if invalid
    end
  end
end

ValueError = Class.new(StandardError)
