#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'grade_school'

class SchoolTest < Minitest::Test
  def test_empty_grade
    subject = School.new
    expected = []
    assert_equal expected, subject.grade(1)
  end

  def test_add_student
    subject = School.new
    assert subject.add('Aimee', 2)
    expected = ['Aimee']
    assert_equal expected, subject.grade(2)
  end

  def test_add_students_to_different_grades
    skip
    subject = School.new
    subject.add('Aimee', 3)
    subject.add('Beemee', 7)
    assert_equal ['Aimee'], subject.grade(3)
    assert_equal ['Beemee'], subject.grade(7)
  end

  def test_grade_with_multiple_students
    skip
    subject  = School.new
    grade    = rand(6)
    students = %w(Aimee Beemee Ceemee)
    students.each { |student| subject.add(student, grade) }
    assert_equal students, subject.grade(grade)
  end

  def test_grade_with_multiple_students_sorts_correctly
    skip
    subject = School.new
    grade    = rand(6)
    students = %w(Beemee Aimee Ceemee)
    students.each { |student| subject.add(student, grade) }
    expected = students.sort
    assert_equal expected, subject.grade(grade)
  end

  def test_empty_students_by_grade
    subject = School.new
    expected = {}
    assert_equal expected, subject.students_by_grade
  end

  def test_students_by_grade
    skip
    subject = School.new
    grade    = rand(6)
    students = %w(Beemee Aimee Ceemee)
    students.each { |student| subject.add(student, grade) }
    expected = { grade => students.sort }
    assert_equal expected, subject.students_by_grade
  end

  def test_students_by_grade_sorted
    skip
    subject = School.new
    everyone.each do |(grade, students)|
      students.each { |student| subject.add(student, grade) }
    end
    expected = everyone_sorted
    assert_equal expected, subject.students_by_grade
  end

  def everyone
    { 2 => %w(Beemee Aimee Ceemee),
      1 => %w(Effmee Geemee),
      3 => %w(Eeemee Deemee) }
  end

  def everyone_sorted
    { 1 => %w(Effmee Geemee),
      2 => %w(Aimee Beemee Ceemee),
      3 => %w(Deemee Eeemee) }
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
    assert_equal 2, BookKeeping::VERSION
  end
end
