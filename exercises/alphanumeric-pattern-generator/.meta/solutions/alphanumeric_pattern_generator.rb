class PatternGenerator
  attr_reader :pattern, :letters, :numbers, :pattern_elements

  def initialize(pattern)
    @pattern = pattern
    @letters = ('a'..'z').to_a
    @numbers = ('0'..'9').to_a
    @pattern_elements = {
      '.' => @letters,
      '#' => @numbers
    }
  end

  def generate(number, diff_pattern = nil)
    return false if number >= total_available
    @number = number
    diff_pattern ||= pattern.chars
    diff_pattern.reverse.map do |element|
      get_root_value(element)
    end.reverse.join('').upcase
  end

  def get_root_value(element)
    if pattern_elements[element]
      value = @number % pattern_elements[element].length
      @number /= pattern_elements[element].length
      pattern_elements[element][value]
    end
  end

  def verify(given, diff_pattern = nil)
    this_pattern = diff_pattern || pattern
    given_pattern = given.downcase.chars
    return false if given_pattern.length != this_pattern.length
    return does_it_match?(given_pattern, this_pattern)
  end

  def does_it_match?(given_pattern, this_pattern)
    given_pattern.map.with_index do |element, i|
      match?(element, this_pattern[i])
    end.all?
  end

  def match?(given_element, pattern_element)
    if pattern_element == '.'
      given_element.downcase =~ /[a-z]/
    elsif pattern_element == '#'
      given_element =~ /[0-9]/
    else
      pattern_element.downcase == given_element.downcase
    end
  end

  def total_available
    char_value = {
      '.' => 26,
      '#' => 10
    }
    pattern.chars.reduce(1) do |result, element|
      result * (char_value[element] ? char_value[element] : 1)
    end
  end
end
