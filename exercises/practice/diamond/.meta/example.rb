class Diamond
  def self.make_diamond(letter)
    script = ""
    have_reached_middle = false
    space_from_middle = 0
    total_lines = ((letter.ord - 64) * 2 - 1)
    middle = total_lines/2
    letter_char_code = 65
    (0..total_lines - 1).each do |i|
      line = Array.new(total_lines, " ")                      # creates a line in each loop
      if i == 0 || i == total_lines - 1                      # placing the letter A in the beginning and end
        line[middle] = "A"
      else
        first_repeated_letter = middle - space_from_middle   # find position and place letters in positions
        second_repeated_letter = middle + space_from_middle
        line[first_repeated_letter] = letter_char_code.chr
        line[second_repeated_letter] = letter_char_code.chr
      end
      script += line.join("") + "\n"
      if i == middle                    #check if reached middle so it can start decrementing position of letters
        have_reached_middle = true
      end
      if !have_reached_middle
        space_from_middle += 1
        letter_char_code += 1
      else
        space_from_middle -= 1
        letter_char_code -= 1
      end
    end                       #end loop
    # puts script             #shows the outputted diamond
    script
  end                          #end method
end
