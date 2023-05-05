class Grid
  def self.saddle_points(grid)
    coordinates = []
    grid.each.with_index do |row, x|
      row.each.with_index do |value, y|
        if value == row.max && value == grid.map {|row| row[y]}.min
          coordinates << {"row" => x+1, "column" => y+1}
        end
      end
    end
    coordinates
  end
end
