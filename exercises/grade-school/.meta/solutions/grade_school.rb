class School
  def initialize
    @students = Hash.new { |hash, key| hash[key] = [] }
  end

  def students_by_grade
    @students.keys.sort.map { |level| grade(level) }
  end

  def add(student, level)
    @students[level] << student
    @students[level].sort!
  end

  def students(level)
    @students[level]
  end

  def grade(level)
    { grade: level, students: students(level) }
  end
end

module BookKeeping
  VERSION = 3
end
