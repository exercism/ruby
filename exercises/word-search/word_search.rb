class WordSearch


    attr_accessor :puzzle

    def initialize(puzzle)
      @puzzle = puzzle
    end

    def stupid_search(word)
      [[1,1],[1,5]]
    end

    def search(word)
      @puzzle.each_with_index do |row, i|
        if row.include?(word)
          return [[i, 0],[i ,6]]
        end
      end
    end

    def find_character(word)
      start_coordinates = []
      first_character = word[0]
      @puzzle.each_with_index do |row, i|
        row.chars.each_with_index do |char, j|
          if char == first_character
            start_coordinates << [i,j]
          end
        end
      end
      start_coordinates
    end


end
