class School
  VERSION = 1

  def initialize
    @db = Hash.new { |db, grade| db[grade] = [] }
  end

  def add(student, grade)
    @db[grade] << student
  end

  def grade(level)
    @db[level].sort
  end

  def to_h
    sorted = @db.map { |grade, students| [grade, students.sort] }.sort
    Hash[sorted]
  end
end
