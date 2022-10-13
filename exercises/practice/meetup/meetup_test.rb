require 'minitest/autorun'
require_relative 'meetup'

class MeetupTest < Minitest::Test
  def test_when_teenth_monday_is_the_13th_the_first_day_of_the_teenth_week
    # skip
    meetup = Meetup.new(5, 2013).day(:monday, :teenth)
    assert_equal Date.parse("2013-05-13"), meetup
  end

  def test_when_teenth_monday_is_the_19th_the_last_day_of_the_teenth_week
    skip
    meetup = Meetup.new(8, 2013).day(:monday, :teenth)
    assert_equal Date.parse("2013-08-19"), meetup
  end

  def test_when_teenth_monday_is_some_day_in_the_middle_of_the_teenth_week
    skip
    meetup = Meetup.new(9, 2013).day(:monday, :teenth)
    assert_equal Date.parse("2013-09-16"), meetup
  end

  def test_when_teenth_tuesday_is_the_19th_the_last_day_of_the_teenth_week
    skip
    meetup = Meetup.new(3, 2013).day(:tuesday, :teenth)
    assert_equal Date.parse("2013-03-19"), meetup
  end

  def test_when_teenth_tuesday_is_some_day_in_the_middle_of_the_teenth_week
    skip
    meetup = Meetup.new(4, 2013).day(:tuesday, :teenth)
    assert_equal Date.parse("2013-04-16"), meetup
  end

  def test_when_teenth_tuesday_is_the_13th_the_first_day_of_the_teenth_week
    skip
    meetup = Meetup.new(8, 2013).day(:tuesday, :teenth)
    assert_equal Date.parse("2013-08-13"), meetup
  end

  def test_when_teenth_wednesday_is_some_day_in_the_middle_of_the_teenth_week
    skip
    meetup = Meetup.new(1, 2013).day(:wednesday, :teenth)
    assert_equal Date.parse("2013-01-16"), meetup
  end

  def test_when_teenth_wednesday_is_the_13th_the_first_day_of_the_teenth_week
    skip
    meetup = Meetup.new(2, 2013).day(:wednesday, :teenth)
    assert_equal Date.parse("2013-02-13"), meetup
  end

  def test_when_teenth_wednesday_is_the_19th_the_last_day_of_the_teenth_week
    skip
    meetup = Meetup.new(6, 2013).day(:wednesday, :teenth)
    assert_equal Date.parse("2013-06-19"), meetup
  end

  def test_when_teenth_thursday_is_some_day_in_the_middle_of_the_teenth_week
    skip
    meetup = Meetup.new(5, 2013).day(:thursday, :teenth)
    assert_equal Date.parse("2013-05-16"), meetup
  end

  def test_when_teenth_thursday_is_the_13th_the_first_day_of_the_teenth_week
    skip
    meetup = Meetup.new(6, 2013).day(:thursday, :teenth)
    assert_equal Date.parse("2013-06-13"), meetup
  end

  def test_when_teenth_thursday_is_the_19th_the_last_day_of_the_teenth_week
    skip
    meetup = Meetup.new(9, 2013).day(:thursday, :teenth)
    assert_equal Date.parse("2013-09-19"), meetup
  end

  def test_when_teenth_friday_is_the_19th_the_last_day_of_the_teenth_week
    skip
    meetup = Meetup.new(4, 2013).day(:friday, :teenth)
    assert_equal Date.parse("2013-04-19"), meetup
  end

  def test_when_teenth_friday_is_some_day_in_the_middle_of_the_teenth_week
    skip
    meetup = Meetup.new(8, 2013).day(:friday, :teenth)
    assert_equal Date.parse("2013-08-16"), meetup
  end

  def test_when_teenth_friday_is_the_13th_the_first_day_of_the_teenth_week
    skip
    meetup = Meetup.new(9, 2013).day(:friday, :teenth)
    assert_equal Date.parse("2013-09-13"), meetup
  end

  def test_when_teenth_saturday_is_some_day_in_the_middle_of_the_teenth_week
    skip
    meetup = Meetup.new(2, 2013).day(:saturday, :teenth)
    assert_equal Date.parse("2013-02-16"), meetup
  end

  def test_when_teenth_saturday_is_the_13th_the_first_day_of_the_teenth_week
    skip
    meetup = Meetup.new(4, 2013).day(:saturday, :teenth)
    assert_equal Date.parse("2013-04-13"), meetup
  end

  def test_when_teenth_saturday_is_the_19th_the_last_day_of_the_teenth_week
    skip
    meetup = Meetup.new(10, 2013).day(:saturday, :teenth)
    assert_equal Date.parse("2013-10-19"), meetup
  end

  def test_when_teenth_sunday_is_the_19th_the_last_day_of_the_teenth_week
    skip
    meetup = Meetup.new(5, 2013).day(:sunday, :teenth)
    assert_equal Date.parse("2013-05-19"), meetup
  end

  def test_when_teenth_sunday_is_some_day_in_the_middle_of_the_teenth_week
    skip
    meetup = Meetup.new(6, 2013).day(:sunday, :teenth)
    assert_equal Date.parse("2013-06-16"), meetup
  end

  def test_when_teenth_sunday_is_the_13th_the_first_day_of_the_teenth_week
    skip
    meetup = Meetup.new(10, 2013).day(:sunday, :teenth)
    assert_equal Date.parse("2013-10-13"), meetup
  end

  def test_when_first_monday_is_some_day_in_the_middle_of_the_first_week
    skip
    meetup = Meetup.new(3, 2013).day(:monday, :first)
    assert_equal Date.parse("2013-03-04"), meetup
  end

  def test_when_first_monday_is_the_1st_the_first_day_of_the_first_week
    skip
    meetup = Meetup.new(4, 2013).day(:monday, :first)
    assert_equal Date.parse("2013-04-01"), meetup
  end

  def test_when_first_tuesday_is_the_7th_the_last_day_of_the_first_week
    skip
    meetup = Meetup.new(5, 2013).day(:tuesday, :first)
    assert_equal Date.parse("2013-05-07"), meetup
  end

  def test_when_first_tuesday_is_some_day_in_the_middle_of_the_first_week
    skip
    meetup = Meetup.new(6, 2013).day(:tuesday, :first)
    assert_equal Date.parse("2013-06-04"), meetup
  end

  def test_when_first_wednesday_is_some_day_in_the_middle_of_the_first_week
    skip
    meetup = Meetup.new(7, 2013).day(:wednesday, :first)
    assert_equal Date.parse("2013-07-03"), meetup
  end

  def test_when_first_wednesday_is_the_7th_the_last_day_of_the_first_week
    skip
    meetup = Meetup.new(8, 2013).day(:wednesday, :first)
    assert_equal Date.parse("2013-08-07"), meetup
  end

  def test_when_first_thursday_is_some_day_in_the_middle_of_the_first_week
    skip
    meetup = Meetup.new(9, 2013).day(:thursday, :first)
    assert_equal Date.parse("2013-09-05"), meetup
  end

  def test_when_first_thursday_is_another_day_in_the_middle_of_the_first_week
    skip
    meetup = Meetup.new(10, 2013).day(:thursday, :first)
    assert_equal Date.parse("2013-10-03"), meetup
  end

  def test_when_first_friday_is_the_1st_the_first_day_of_the_first_week
    skip
    meetup = Meetup.new(11, 2013).day(:friday, :first)
    assert_equal Date.parse("2013-11-01"), meetup
  end

  def test_when_first_friday_is_some_day_in_the_middle_of_the_first_week
    skip
    meetup = Meetup.new(12, 2013).day(:friday, :first)
    assert_equal Date.parse("2013-12-06"), meetup
  end

  def test_when_first_saturday_is_some_day_in_the_middle_of_the_first_week
    skip
    meetup = Meetup.new(1, 2013).day(:saturday, :first)
    assert_equal Date.parse("2013-01-05"), meetup
  end

  def test_when_first_saturday_is_another_day_in_the_middle_of_the_first_week
    skip
    meetup = Meetup.new(2, 2013).day(:saturday, :first)
    assert_equal Date.parse("2013-02-02"), meetup
  end

  def test_when_first_sunday_is_some_day_in_the_middle_of_the_first_week
    skip
    meetup = Meetup.new(3, 2013).day(:sunday, :first)
    assert_equal Date.parse("2013-03-03"), meetup
  end

  def test_when_first_sunday_is_the_7th_the_last_day_of_the_first_week
    skip
    meetup = Meetup.new(4, 2013).day(:sunday, :first)
    assert_equal Date.parse("2013-04-07"), meetup
  end

  def test_when_second_monday_is_some_day_in_the_middle_of_the_second_week
    skip
    meetup = Meetup.new(3, 2013).day(:monday, :second)
    assert_equal Date.parse("2013-03-11"), meetup
  end

  def test_when_second_monday_is_the_8th_the_first_day_of_the_second_week
    skip
    meetup = Meetup.new(4, 2013).day(:monday, :second)
    assert_equal Date.parse("2013-04-08"), meetup
  end

  def test_when_second_tuesday_is_the_14th_the_last_day_of_the_second_week
    skip
    meetup = Meetup.new(5, 2013).day(:tuesday, :second)
    assert_equal Date.parse("2013-05-14"), meetup
  end

  def test_when_second_tuesday_is_some_day_in_the_middle_of_the_second_week
    skip
    meetup = Meetup.new(6, 2013).day(:tuesday, :second)
    assert_equal Date.parse("2013-06-11"), meetup
  end

  def test_when_second_wednesday_is_some_day_in_the_middle_of_the_second_week
    skip
    meetup = Meetup.new(7, 2013).day(:wednesday, :second)
    assert_equal Date.parse("2013-07-10"), meetup
  end

  def test_when_second_wednesday_is_the_14th_the_last_day_of_the_second_week
    skip
    meetup = Meetup.new(8, 2013).day(:wednesday, :second)
    assert_equal Date.parse("2013-08-14"), meetup
  end

  def test_when_second_thursday_is_some_day_in_the_middle_of_the_second_week
    skip
    meetup = Meetup.new(9, 2013).day(:thursday, :second)
    assert_equal Date.parse("2013-09-12"), meetup
  end

  def test_when_second_thursday_is_another_day_in_the_middle_of_the_second_week
    skip
    meetup = Meetup.new(10, 2013).day(:thursday, :second)
    assert_equal Date.parse("2013-10-10"), meetup
  end

  def test_when_second_friday_is_the_8th_the_first_day_of_the_second_week
    skip
    meetup = Meetup.new(11, 2013).day(:friday, :second)
    assert_equal Date.parse("2013-11-08"), meetup
  end

  def test_when_second_friday_is_some_day_in_the_middle_of_the_second_week
    skip
    meetup = Meetup.new(12, 2013).day(:friday, :second)
    assert_equal Date.parse("2013-12-13"), meetup
  end

  def test_when_second_saturday_is_some_day_in_the_middle_of_the_second_week
    skip
    meetup = Meetup.new(1, 2013).day(:saturday, :second)
    assert_equal Date.parse("2013-01-12"), meetup
  end

  def test_when_second_saturday_is_another_day_in_the_middle_of_the_second_week
    skip
    meetup = Meetup.new(2, 2013).day(:saturday, :second)
    assert_equal Date.parse("2013-02-09"), meetup
  end

  def test_when_second_sunday_is_some_day_in_the_middle_of_the_second_week
    skip
    meetup = Meetup.new(3, 2013).day(:sunday, :second)
    assert_equal Date.parse("2013-03-10"), meetup
  end

  def test_when_second_sunday_is_the_14th_the_last_day_of_the_second_week
    skip
    meetup = Meetup.new(4, 2013).day(:sunday, :second)
    assert_equal Date.parse("2013-04-14"), meetup
  end

  def test_when_third_monday_is_some_day_in_the_middle_of_the_third_week
    skip
    meetup = Meetup.new(3, 2013).day(:monday, :third)
    assert_equal Date.parse("2013-03-18"), meetup
  end

  def test_when_third_monday_is_the_15th_the_first_day_of_the_third_week
    skip
    meetup = Meetup.new(4, 2013).day(:monday, :third)
    assert_equal Date.parse("2013-04-15"), meetup
  end

  def test_when_third_tuesday_is_the_21st_the_last_day_of_the_third_week
    skip
    meetup = Meetup.new(5, 2013).day(:tuesday, :third)
    assert_equal Date.parse("2013-05-21"), meetup
  end

  def test_when_third_tuesday_is_some_day_in_the_middle_of_the_third_week
    skip
    meetup = Meetup.new(6, 2013).day(:tuesday, :third)
    assert_equal Date.parse("2013-06-18"), meetup
  end

  def test_when_third_wednesday_is_some_day_in_the_middle_of_the_third_week
    skip
    meetup = Meetup.new(7, 2013).day(:wednesday, :third)
    assert_equal Date.parse("2013-07-17"), meetup
  end

  def test_when_third_wednesday_is_the_21st_the_last_day_of_the_third_week
    skip
    meetup = Meetup.new(8, 2013).day(:wednesday, :third)
    assert_equal Date.parse("2013-08-21"), meetup
  end

  def test_when_third_thursday_is_some_day_in_the_middle_of_the_third_week
    skip
    meetup = Meetup.new(9, 2013).day(:thursday, :third)
    assert_equal Date.parse("2013-09-19"), meetup
  end

  def test_when_third_thursday_is_another_day_in_the_middle_of_the_third_week
    skip
    meetup = Meetup.new(10, 2013).day(:thursday, :third)
    assert_equal Date.parse("2013-10-17"), meetup
  end

  def test_when_third_friday_is_the_15th_the_first_day_of_the_third_week
    skip
    meetup = Meetup.new(11, 2013).day(:friday, :third)
    assert_equal Date.parse("2013-11-15"), meetup
  end

  def test_when_third_friday_is_some_day_in_the_middle_of_the_third_week
    skip
    meetup = Meetup.new(12, 2013).day(:friday, :third)
    assert_equal Date.parse("2013-12-20"), meetup
  end

  def test_when_third_saturday_is_some_day_in_the_middle_of_the_third_week
    skip
    meetup = Meetup.new(1, 2013).day(:saturday, :third)
    assert_equal Date.parse("2013-01-19"), meetup
  end

  def test_when_third_saturday_is_another_day_in_the_middle_of_the_third_week
    skip
    meetup = Meetup.new(2, 2013).day(:saturday, :third)
    assert_equal Date.parse("2013-02-16"), meetup
  end

  def test_when_third_sunday_is_some_day_in_the_middle_of_the_third_week
    skip
    meetup = Meetup.new(3, 2013).day(:sunday, :third)
    assert_equal Date.parse("2013-03-17"), meetup
  end

  def test_when_third_sunday_is_the_21st_the_last_day_of_the_third_week
    skip
    meetup = Meetup.new(4, 2013).day(:sunday, :third)
    assert_equal Date.parse("2013-04-21"), meetup
  end

  def test_when_fourth_monday_is_some_day_in_the_middle_of_the_fourth_week
    skip
    meetup = Meetup.new(3, 2013).day(:monday, :fourth)
    assert_equal Date.parse("2013-03-25"), meetup
  end

  def test_when_fourth_monday_is_the_22nd_the_first_day_of_the_fourth_week
    skip
    meetup = Meetup.new(4, 2013).day(:monday, :fourth)
    assert_equal Date.parse("2013-04-22"), meetup
  end

  def test_when_fourth_tuesday_is_the_28th_the_last_day_of_the_fourth_week
    skip
    meetup = Meetup.new(5, 2013).day(:tuesday, :fourth)
    assert_equal Date.parse("2013-05-28"), meetup
  end

  def test_when_fourth_tuesday_is_some_day_in_the_middle_of_the_fourth_week
    skip
    meetup = Meetup.new(6, 2013).day(:tuesday, :fourth)
    assert_equal Date.parse("2013-06-25"), meetup
  end

  def test_when_fourth_wednesday_is_some_day_in_the_middle_of_the_fourth_week
    skip
    meetup = Meetup.new(7, 2013).day(:wednesday, :fourth)
    assert_equal Date.parse("2013-07-24"), meetup
  end

  def test_when_fourth_wednesday_is_the_28th_the_last_day_of_the_fourth_week
    skip
    meetup = Meetup.new(8, 2013).day(:wednesday, :fourth)
    assert_equal Date.parse("2013-08-28"), meetup
  end

  def test_when_fourth_thursday_is_some_day_in_the_middle_of_the_fourth_week
    skip
    meetup = Meetup.new(9, 2013).day(:thursday, :fourth)
    assert_equal Date.parse("2013-09-26"), meetup
  end

  def test_when_fourth_thursday_is_another_day_in_the_middle_of_the_fourth_week
    skip
    meetup = Meetup.new(10, 2013).day(:thursday, :fourth)
    assert_equal Date.parse("2013-10-24"), meetup
  end

  def test_when_fourth_friday_is_the_22nd_the_first_day_of_the_fourth_week
    skip
    meetup = Meetup.new(11, 2013).day(:friday, :fourth)
    assert_equal Date.parse("2013-11-22"), meetup
  end

  def test_when_fourth_friday_is_some_day_in_the_middle_of_the_fourth_week
    skip
    meetup = Meetup.new(12, 2013).day(:friday, :fourth)
    assert_equal Date.parse("2013-12-27"), meetup
  end

  def test_when_fourth_saturday_is_some_day_in_the_middle_of_the_fourth_week
    skip
    meetup = Meetup.new(1, 2013).day(:saturday, :fourth)
    assert_equal Date.parse("2013-01-26"), meetup
  end

  def test_when_fourth_saturday_is_another_day_in_the_middle_of_the_fourth_week
    skip
    meetup = Meetup.new(2, 2013).day(:saturday, :fourth)
    assert_equal Date.parse("2013-02-23"), meetup
  end

  def test_when_fourth_sunday_is_some_day_in_the_middle_of_the_fourth_week
    skip
    meetup = Meetup.new(3, 2013).day(:sunday, :fourth)
    assert_equal Date.parse("2013-03-24"), meetup
  end

  def test_when_fourth_sunday_is_the_28th_the_last_day_of_the_fourth_week
    skip
    meetup = Meetup.new(4, 2013).day(:sunday, :fourth)
    assert_equal Date.parse("2013-04-28"), meetup
  end

  def test_last_monday_in_a_month_with_four_mondays
    skip
    meetup = Meetup.new(3, 2013).day(:monday, :last)
    assert_equal Date.parse("2013-03-25"), meetup
  end

  def test_last_monday_in_a_month_with_five_mondays
    skip
    meetup = Meetup.new(4, 2013).day(:monday, :last)
    assert_equal Date.parse("2013-04-29"), meetup
  end

  def test_last_tuesday_in_a_month_with_four_tuesdays
    skip
    meetup = Meetup.new(5, 2013).day(:tuesday, :last)
    assert_equal Date.parse("2013-05-28"), meetup
  end

  def test_last_tuesday_in_another_month_with_four_tuesdays
    skip
    meetup = Meetup.new(6, 2013).day(:tuesday, :last)
    assert_equal Date.parse("2013-06-25"), meetup
  end

  def test_last_wednesday_in_a_month_with_five_wednesdays
    skip
    meetup = Meetup.new(7, 2013).day(:wednesday, :last)
    assert_equal Date.parse("2013-07-31"), meetup
  end

  def test_last_wednesday_in_a_month_with_four_wednesdays
    skip
    meetup = Meetup.new(8, 2013).day(:wednesday, :last)
    assert_equal Date.parse("2013-08-28"), meetup
  end

  def test_last_thursday_in_a_month_with_four_thursdays
    skip
    meetup = Meetup.new(9, 2013).day(:thursday, :last)
    assert_equal Date.parse("2013-09-26"), meetup
  end

  def test_last_thursday_in_a_month_with_five_thursdays
    skip
    meetup = Meetup.new(10, 2013).day(:thursday, :last)
    assert_equal Date.parse("2013-10-31"), meetup
  end

  def test_last_friday_in_a_month_with_five_fridays
    skip
    meetup = Meetup.new(11, 2013).day(:friday, :last)
    assert_equal Date.parse("2013-11-29"), meetup
  end

  def test_last_friday_in_a_month_with_four_fridays
    skip
    meetup = Meetup.new(12, 2013).day(:friday, :last)
    assert_equal Date.parse("2013-12-27"), meetup
  end

  def test_last_saturday_in_a_month_with_four_saturdays
    skip
    meetup = Meetup.new(1, 2013).day(:saturday, :last)
    assert_equal Date.parse("2013-01-26"), meetup
  end

  def test_last_saturday_in_another_month_with_four_saturdays
    skip
    meetup = Meetup.new(2, 2013).day(:saturday, :last)
    assert_equal Date.parse("2013-02-23"), meetup
  end

  def test_last_sunday_in_a_month_with_five_sundays
    skip
    meetup = Meetup.new(3, 2013).day(:sunday, :last)
    assert_equal Date.parse("2013-03-31"), meetup
  end

  def test_last_sunday_in_a_month_with_four_sundays
    skip
    meetup = Meetup.new(4, 2013).day(:sunday, :last)
    assert_equal Date.parse("2013-04-28"), meetup
  end

  def test_when_last_wednesday_in_february_in_a_leap_year_is_the_29th
    skip
    meetup = Meetup.new(2, 2012).day(:wednesday, :last)
    assert_equal Date.parse("2012-02-29"), meetup
  end

  def test_last_wednesday_in_december_that_is_also_the_last_day_of_the_year
    skip
    meetup = Meetup.new(12, 2014).day(:wednesday, :last)
    assert_equal Date.parse("2014-12-31"), meetup
  end

  def test_when_last_sunday_in_february_in_a_non_leap_year_is_not_the_29th
    skip
    meetup = Meetup.new(2, 2015).day(:sunday, :last)
    assert_equal Date.parse("2015-02-22"), meetup
  end

  def test_when_first_friday_is_the_7th_the_last_day_of_the_first_week
    skip
    meetup = Meetup.new(12, 2012).day(:friday, :first)
    assert_equal Date.parse("2012-12-07"), meetup
  end
end
