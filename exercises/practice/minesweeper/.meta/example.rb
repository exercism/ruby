class Minesweeper
  def self.annotate(minefield)
    new(minefield).annotate
  end

  attr_reader :minefield
  def initialize(minefield)
    @minefield = minefield
  end

  def annotate
    (0..rows).map do |row|
      (0..columns).map do |column|
        notation_at(row, column)
      end.join("")
    end
  end

  private

  def notation_at(row, column)
    if mine_coordinates.include?([row, column])
      return "*"
    end
    mines = surrounding_coordinates(row, column).count {|x, y|
      mine_coordinates.include?([x, y])
    }
    if mines.zero?
      " "
    else
      mines.to_s
    end
  end

  def surrounding_coordinates(row, column)
    [
      [row-1, column-1],
      [row-1, column],
      [row-1, column+1],
      [row, column-1],
      [row, column+1],
      [row+1, column-1],
      [row+1, column],
      [row+1, column+1]
    ].reject {|x, y| invalid_coordinate(x, y)}
  end

  def invalid_coordinate(x, y)
    x < 0 || y < 0 || x > rows || y > columns
  end

  def mine_coordinates
    return @mine_coordinates if @mine_coordinates

    @mine_coordinates = []
    minefield.each.with_index do |row, x|
      row.chars.each.with_index do |cell, y|
        if cell == "*"
          @mine_coordinates << [x, y]
        end
      end
    end
    @mine_coordinates
  end

  def rows
    @rows ||= minefield.size-1
  end

  def columns
    @columns ||= minefield.first.size-1
  end
end
