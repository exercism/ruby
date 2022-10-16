class School
  def initialize
    @students = Hash.new { |hash, key| hash[key] = [] }
  end

  def add(student, grade)
    if roster.include?(student)
      return false
    end
    students[grade] << student
    true
  end

  def roster
    students.sort_by {|grade, names| grade}.map {|_, names| names.sort}.flatten
  end

  def grade(number)
    students[number].sort
  end

  private
  attr_reader :students
end
