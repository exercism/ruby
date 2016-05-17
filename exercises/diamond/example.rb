require "pry"

class Diamond
	attr_accessor :counter_tracker, :counter, :middle, :total_lines, :letter

  def initialize(letter)
	@counter_tracker = []
	self.counter = 0
    @total_lines = ((letter.ord - 64) * 2 - 1)           # 3 spaces in total
	@middle = total_lines/2
    @letter = letter
  end

  def run
  	self.make_diamond(letter)
  end

  def make_diamond(letter)
  	  letter_char_code = 65                                  #starting letter
	  (0..total_lines - 1).each do |i|                        # iterate the number of total spaces

	    line = Array.new(total_lines," ")                     #when A creates something like[' ',' ',' '] through each loop to start fresh
	    if i == 0 || i == total_lines - 1                     # first and last iteration gets one letter

	      line[middle] = letter_char_code.chr                 #wish will always be in the middle
	    else

	      first_repeated_letter = middle - self.counter            # first repeated letter position compared to the middle
	      second_repeated_letter = middle + self.counter           # second repeated letter position compared to the middle
	      line[first_repeated_letter] = letter_char_code.chr  #placing first letter in the line
	      line[second_repeated_letter] = letter_char_code.chr  #placing second letter in the line
	    end

	    puts line.join(" ")                                  #combines the line and creates each layer
	                # if counter_should_count_up

	    if counter_should_count_up?
	  	  counter_tracker << self.counter                            #once it hits the middle decrement the letter and position
	      self.counter += 1 ; letter_char_code += 1

        elsif counter_should_count_down?
	   	  counter_tracker << self.counter
	      letter_char_code -= 1 ; self.counter -= 1
	                                                                         #else increment the two values
	    end
     end
   end


  def counter_should_count_up?
     (counter_tracker.empty? || (self.counter < middle && self.counter > counter_tracker.last))
  end


   def counter_should_count_down?
      self.counter == middle || (self.counter < middle && self.counter < counter_tracker.last)
   end

end
