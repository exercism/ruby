class FlowerField
  def self.annotate(garden)
    new(garden).annotate
  end

  attr_reader :garden
  def initialize(garden)
    @garden = garden
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
    if flower_coordinates.include?([row, column])
      return "*"
    end
    flowers = surrounding_coordinates(row, column).count {|x, y|
      flower_coordinates.include?([x, y])
    }
    if flowers.zero?
      " "
    else
      flowers.to_s
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

  def flower_coordinates
    return @flower_coordinates if @flower_coordinates

    @flower_coordinates = []
    garden.each.with_index do |row, x|
      row.chars.each.with_index do |cell, y|
        if cell == "*"
          @flower_coordinates << [x, y]
        end
      end
    end
    @flower_coordinates
  end

  def rows
    @rows ||= garden.size-1
  end

  def columns
    @columns ||= garden.first.size-1
  end
end
