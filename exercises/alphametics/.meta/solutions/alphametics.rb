class Alphametics

  def self.solve(equation)
    new.solve(equation)
  end

  def solve(equation)
    @prime_solver = AlphaSolver.new(equation)
    solve_using_partials
  end

  private

  attr_accessor :prime_solver

  def solve_using_partials
    prime_solver.partial_solutions.each do |partial_solution|
      sub_solver = AlphaSolver.new(prime_solver.partial_equation(partial_solution))
      sub_solution = sub_solver.first_solution
      return sub_solution.merge(partial_solution) if sub_solution
    end
    {}
  end

end

class AlphaSolver

  def initialize(input_equation)
    @input_equation = input_equation.gsub('^', '**')
    @puzzle = Puzzle.new(input_equation)
  end

  def partial_solutions
    AlphaSolver.new(puzzle.simplified).all_solutions
  end

  def all_solutions
    numeric_permutations.map { |values| result_table if solution?(values) }.compact
  end

  def first_solution
    numeric_permutations.each { |values| return result_table if solution?(values) }
    nil
  end

  def partial_equation(partial_solution)
    input_equation.tr(partial_solution.keys.join, partial_solution.values.join)
  end

  private

  attr_reader :input_equation, :puzzle
  attr_accessor :proposed_values

  def solution?(values)
    self.proposed_values = values.join
    proposed_equation_qualified? && proposed_equation_evaluates?
  end

  def proposed_equation
    input_equation.tr(puzzle_letters, proposed_values)
  end

  def numeric_permutations
    puzzle.numeric_permutations
  end

  def puzzle_letters
    puzzle.letters
  end

  def proposed_equation_qualified?
    (proposed_equation =~ /\b0\d+/).nil?
  end

  def proposed_equation_evaluates?
    eval(proposed_equation)
  end

  def result_table
    Hash[puzzle_letters.chars.zip(result_numbers)]
  end

  def result_numbers
    proposed_values.chars.map(&:to_i)
  end

end

class Puzzle

  PATTERNS = {mod_10: ' % 10',
              adjacent_letters: /(\b)([A-Z]{1,})([A-Z])/,
              equation_left_side: /(.*)( == )/}

  def initialize(string_equation)
    @string_equation = string_equation
  end

  def letters
    @letters ||= string_equation.scan(/[A-Z]/).uniq.join
  end

  def numeric_permutations
    @numeric_permutations ||= unused_numbers.to_a.permutation(letter_count)
  end

  def simplified
    @simplified ||= string_equation
                        .gsub(PATTERNS[:adjacent_letters], "\\1\\3")
                        .gsub(PATTERNS[:equation_left_side], "(\\1)#{PATTERNS[:mod_10]}\\2")
  end

  private

  attr_reader :string_equation

  def letter_count
    @letter_count ||= letters.length
  end

  def unused_numbers
    @unused_numbers ||= (0..9).to_a.map(&:to_s) - used_numbers
  end

  def used_numbers
    @used_numbers ||= string_equation.gsub(PATTERNS[:mod_10], '').scan(/\d/).uniq
  end

end
