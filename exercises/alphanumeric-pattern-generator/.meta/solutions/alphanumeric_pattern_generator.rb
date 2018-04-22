module BookKeeping
  VERSION = 1
end

class PatternGenerator
  attr_reader :pattern, :pattern_elements, :letters, :numbers

  def initialize(pattern)
    @pattern = pattern
    @pattern_elements = get_pattern_elements
    @letters = @pattern_elements['.']
    @numbers = @pattern_elements['#']
  end

  def generate(number)
    return false if number >= total_available
    @number = number
    pattern.chars.reverse.map do |element|
      get_root_value(element)
    end.reverse.join.upcase
  end

  def verify(given)
    given_pattern = given.downcase.chars
    return false if given_pattern.length != pattern.length
    does_it_match?(given_pattern, pattern)
  end

  def total_available
    pattern.chars.reduce(1) do |result, element|
      result * (pattern_elements[element] ? pattern_elements[element].count : 1)
    end
  end

  private
  def get_pattern_elements
    {
      '.' => ('a'..'z').to_a,
      '#' => ('0'..'9').to_a
    }
  end

  def get_root_value(element)
    if pattern_elements[element]
      value = @number % pattern_elements[element].count
      @number /= pattern_elements[element].count
      pattern_elements[element][value]
    end
  end

  def does_it_match?(given_pattern, this_pattern)
    given_pattern.map.with_index do |element, i|
      match?(element, this_pattern[i])
    end.all?
  end

  def match?(given_element, pattern_element)
    if pattern_elements[pattern_element]
      pattern_elements[pattern_element].index(given_element)
    else
      pattern_element.downcase == given_element.downcase
    end
  end
end
