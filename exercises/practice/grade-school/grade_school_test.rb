require 'minitest/autorun'
require_relative 'grade_school'

class GradeSchoolTest < Minitest::Test
  def test_roster_is_empty_when_no_student_is_added
    # skip
    school = School.new
    assert_empty [], school.roster
  end

  def test_add_a_student
    skip
    school = School.new
    results = []
    results << school.add("Aimee", 2)
    assert_equal [true], results
  end

  def test_student_is_added_to_the_roster
    skip
    school = School.new
    school.add("Aimee", 2)
    assert_equal ["Aimee"], school.roster
  end

  def test_adding_multiple_students_in_the_same_grade_in_the_roster
    skip
    school = School.new
    results = []
    results << school.add("Blair", 2)
    results << school.add("James", 2)
    results << school.add("Paul", 2)
    assert_equal [true, true, true], results
  end

  def test_multiple_students_in_the_same_grade_are_added_to_the_roster
    skip
    school = School.new
    school.add("Blair", 2)
    school.add("James", 2)
    school.add("Paul", 2)
    assert_equal %w[Blair James Paul], school.roster
  end

  def test_cannot_add_student_to_same_grade_in_the_roster_more_than_once
    skip
    school = School.new
    results = []
    results << school.add("Blair", 2)
    results << school.add("James", 2)
    results << school.add("James", 2)
    results << school.add("Paul", 2)
    assert_equal [true, true, false, true], results
  end

  def test_student_not_added_to_same_grade_in_the_roster_more_than_once
    skip
    school = School.new
    school.add("Blair", 2)
    school.add("James", 2)
    school.add("James", 2)
    school.add("Paul", 2)
    assert_equal %w[Blair James Paul], school.roster
  end

  def test_adding_students_in_multiple_grades
    skip
    school = School.new
    results = []
    results << school.add("Chelsea", 3)
    results << school.add("Logan", 7)
    assert_equal [true, true], results
  end

  def test_students_in_multiple_grades_are_added_to_the_roster
    skip
    school = School.new
    school.add("Chelsea", 3)
    school.add("Logan", 7)
    assert_equal %w[Chelsea Logan], school.roster
  end

  def test_cannot_add_same_student_to_multiple_grades_in_the_roster
    skip
    school = School.new
    results = []
    results << school.add("Blair", 2)
    results << school.add("James", 2)
    results << school.add("James", 3)
    results << school.add("Paul", 3)
    assert_equal [true, true, false, true], results
  end

  def test_student_not_added_to_multiple_grades_in_the_roster
    skip
    school = School.new
    school.add("Blair", 2)
    school.add("James", 2)
    school.add("James", 3)
    school.add("Paul", 3)
    assert_equal %w[Blair James Paul], school.roster
  end

  def test_students_are_sorted_by_grades_in_the_roster
    skip
    school = School.new
    school.add("Jim", 3)
    school.add("Peter", 2)
    school.add("Anna", 1)
    assert_equal %w[Anna Peter Jim], school.roster
  end

  def test_students_are_sorted_by_name_in_the_roster
    skip
    school = School.new
    school.add("Peter", 2)
    school.add("Zoe", 2)
    school.add("Alex", 2)
    assert_equal %w[Alex Peter Zoe], school.roster
  end

  def test_students_are_sorted_by_grades_and_then_by_name_in_the_roster
    skip
    school = School.new
    school.add("Peter", 2)
    school.add("Anna", 1)
    school.add("Barb", 1)
    school.add("Zoe", 2)
    school.add("Alex", 2)
    school.add("Jim", 3)
    school.add("Charlie", 1)
    assert_equal %w[Anna Barb Charlie Alex Peter Zoe Jim], school.roster
  end

  def test_grade_is_empty_if_no_students_in_the_roster
    skip
    school = School.new
    assert_empty [], school.grade(1)
  end

  def test_grade_is_empty_if_no_students_in_that_grade
    skip
    school = School.new
    school.add("Peter", 2)
    school.add("Zoe", 2)
    school.add("Alex", 2)
    school.add("Jim", 3)
    assert_empty school.grade(1)
  end

  def test_student_not_added_to_same_grade_more_than_once
    skip
    school = School.new
    school.add("Blair", 2)
    school.add("James", 2)
    school.add("James", 2)
    school.add("Paul", 2)
    assert_equal %w[Blair James Paul], school.grade(2)
  end

  def test_student_not_added_to_multiple_grades
    skip
    school = School.new
    school.add("Blair", 2)
    school.add("James", 2)
    school.add("James", 3)
    school.add("Paul", 3)
    assert_equal %w[Blair James], school.grade(2)
  end

  def test_student_not_added_to_other_grade_for_multiple_grades
    skip
    school = School.new
    school.add("Blair", 2)
    school.add("James", 2)
    school.add("James", 3)
    school.add("Paul", 3)
    assert_equal ["Paul"], school.grade(3)
  end

  def test_students_are_sorted_by_name_in_a_grade
    skip
    school = School.new
    school.add("Franklin", 5)
    school.add("Bradley", 5)
    school.add("Jeff", 1)
    assert_equal %w[Bradley Franklin], school.grade(5)
  end
end
