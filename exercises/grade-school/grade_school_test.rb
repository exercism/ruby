#!/usr/bin/env ruby
require 'minitest/autorun'
require_relative 'grade_school'

class SchoolTest < Minitest::Test
  def test_empty_grade
    school = School.new
    expected = []
    assert_equal expected, school.students(1)
  end

  def test_add_student
    skip
    school = School.new
    assert school.add('Aimee', 2)
    expected = ['Aimee']
    assert_equal expected, school.students(2)
  end

  def test_add_students_to_different_grades
    skip
    school = School.new
    school.add('Aimee', 3)
    school.add('Beemee', 7)
    assert_equal ['Aimee'], school.students(3)
    assert_equal ['Beemee'], school.students(7)
  end

  def test_grade_with_multiple_students
    skip
    school = School.new
    grade    = 6
    students = %w(Aimee Beemee Ceemee)
    students.each { |student| school.add(student, grade) }
    assert_equal students, school.students(grade)
  end

  def test_grade_with_multiple_students_sorts_correctly
    skip
    school = School.new
    grade    = 6
    students = %w(Beemee Aimee Ceemee)
    students.each { |student| school.add(student, grade) }
    expected = students.sort
    assert_equal expected, school.students(grade)
  end

  def test_empty_students_by_grade
    skip
    school = School.new
    expected = []
    assert_equal expected, school.students_by_grade
  end

  def test_students_by_grade
    skip
    school = School.new
    grade    = 6
    students = %w(Beemee Aimee Ceemee)
    students.each { |student| school.add(student, grade) }
    expected = [{ grade: grade, students: students.sort }]
    assert_equal expected, school.students_by_grade
  end

  def test_students_by_grade_sorted
    skip
    school = School.new
    everyone.each do |grade|
      grade[:students].each { |student| school.add(student, grade[:grade]) }
    end
    expected = everyone_sorted
    assert_equal expected, school.students_by_grade
  end

  def everyone
    [
      { grade: 3, students: %w(Deemee Eeemee) },
      { grade: 1, students: %w(Effmee Geemee) },
      { grade: 2, students: %w(Aimee Beemee Ceemee) }
    ]
  end

  def everyone_sorted
    [
      { grade: 1, students: %w(Effmee Geemee) },
      { grade: 2, students: %w(Aimee Beemee Ceemee) },
      { grade: 3, students: %w(Deemee Eeemee) }
    ]
  end

  # Problems in exercism evolve over time, as we find better ways to ask
  # questions.
  # The version number refers to the version of the problem you solved,
  # not your solution.
  #
  # Define a constant named VERSION inside of the top level BookKeeping
  # module, which may be placed near the end of your file.
  #
  # In your file, it will look like this:
  #
  # module BookKeeping
  #   VERSION = 2 # Where the version number matches the one in the test.
  # end
  #
  # If you are curious, read more about constants on RubyDoc:
  # http://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/constants.html

  def test_bookkeeping
    skip
    assert_equal 3, BookKeeping::VERSION
  end
end
