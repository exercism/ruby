require 'pry'
class WordSearch


    attr_accessor :puzzle, :start_coordinates

    def initialize(puzzle)
      @puzzle = puzzle
      @start_coordinates = []
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

    def find_start_character(word)
      first_character = word[0]
      @puzzle.each_with_index do |row, i|
        row.chars.each_with_index do |char, j|
          if char == first_character
            @start_coordinates << [i,j]
          end
        end
      end
    end

    def build_words(word)
     build_until = word.size - 1
     @start_coordinates.each do |coordinate|
       new_word = ""
       k = 0
       until k == build_until
        new_word <<  @puzzle[coordinate[0]].chars[coordinate[1+k]]
         k += 1
       end
       if word == new_word
         return [[coordinate],[coordinate[0]].chars[coordinate[1+k]]]
       end
     end
    end

end

PUZZLE =
  ["clojurermt",
    "jefblpepre",
   "camdcimgtc",
   "oivokprjsm",
   "pbwasqroua",
   "rixilelhrs",
   "wolcqlirpc",
   "screeaumgr",
   "alxhpburyi",
   "jalaycalmp",
   ]
test = WordSearch.new(PUZZLE)
test.find_start_character("clojure")

puts test.build_words("clojure")
