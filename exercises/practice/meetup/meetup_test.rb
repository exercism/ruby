require 'minitest/autorun'
require_relative 'meetup'

# rubocop:disable Naming/VariableNumber

# Common test data version: 1.1.0 56cdfa5
class MeetupTest < Minitest::Test
  def test_monteenth_of_may_2013
    # skip
    meetup = Meetup.new(5, 2013).day(:monday, :teenth)
    assert_equal Date.parse("2013-05-13"), meetup
  end

  def test_monteenth_of_august_2013
    skip
    meetup = Meetup.new(8, 2013).day(:monday, :teenth)
    assert_equal Date.parse("2013-08-19"), meetup
  end

  def test_monteenth_of_september_2013
    skip
    meetup = Meetup.new(9, 2013).day(:monday, :teenth)
    assert_equal Date.parse("2013-09-16"), meetup
  end

  def test_tuesteenth_of_march_2013
    skip
    meetup = Meetup.new(3, 2013).day(:tuesday, :teenth)
    assert_equal Date.parse("2013-03-19"), meetup
  end

  def test_tuesteenth_of_april_2013
    skip
    meetup = Meetup.new(4, 2013).day(:tuesday, :teenth)
    assert_equal Date.parse("2013-04-16"), meetup
  end

  def test_tuesteenth_of_august_2013
    skip
    meetup = Meetup.new(8, 2013).day(:tuesday, :teenth)
    assert_equal Date.parse("2013-08-13"), meetup
  end

  def test_wednesteenth_of_january_2013
    skip
    meetup = Meetup.new(1, 2013).day(:wednesday, :teenth)
    assert_equal Date.parse("2013-01-16"), meetup
  end

  def test_wednesteenth_of_february_2013
    skip
    meetup = Meetup.new(2, 2013).day(:wednesday, :teenth)
    assert_equal Date.parse("2013-02-13"), meetup
  end

  def test_wednesteenth_of_june_2013
    skip
    meetup = Meetup.new(6, 2013).day(:wednesday, :teenth)
    assert_equal Date.parse("2013-06-19"), meetup
  end

  def test_thursteenth_of_may_2013
    skip
    meetup = Meetup.new(5, 2013).day(:thursday, :teenth)
    assert_equal Date.parse("2013-05-16"), meetup
  end

  def test_thursteenth_of_june_2013
    skip
    meetup = Meetup.new(6, 2013).day(:thursday, :teenth)
    assert_equal Date.parse("2013-06-13"), meetup
  end

  def test_thursteenth_of_september_2013
    skip
    meetup = Meetup.new(9, 2013).day(:thursday, :teenth)
    assert_equal Date.parse("2013-09-19"), meetup
  end

  def test_friteenth_of_april_2013
    skip
    meetup = Meetup.new(4, 2013).day(:friday, :teenth)
    assert_equal Date.parse("2013-04-19"), meetup
  end

  def test_friteenth_of_august_2013
    skip
    meetup = Meetup.new(8, 2013).day(:friday, :teenth)
    assert_equal Date.parse("2013-08-16"), meetup
  end

  def test_friteenth_of_september_2013
    skip
    meetup = Meetup.new(9, 2013).day(:friday, :teenth)
    assert_equal Date.parse("2013-09-13"), meetup
  end

  def test_saturteenth_of_february_2013
    skip
    meetup = Meetup.new(2, 2013).day(:saturday, :teenth)
    assert_equal Date.parse("2013-02-16"), meetup
  end

  def test_saturteenth_of_april_2013
    skip
    meetup = Meetup.new(4, 2013).day(:saturday, :teenth)
    assert_equal Date.parse("2013-04-13"), meetup
  end

  def test_saturteenth_of_october_2013
    skip
    meetup = Meetup.new(10, 2013).day(:saturday, :teenth)
    assert_equal Date.parse("2013-10-19"), meetup
  end

  def test_sunteenth_of_may_2013
    skip
    meetup = Meetup.new(5, 2013).day(:sunday, :teenth)
    assert_equal Date.parse("2013-05-19"), meetup
  end

  def test_sunteenth_of_june_2013
    skip
    meetup = Meetup.new(6, 2013).day(:sunday, :teenth)
    assert_equal Date.parse("2013-06-16"), meetup
  end

  def test_sunteenth_of_october_2013
    skip
    meetup = Meetup.new(10, 2013).day(:sunday, :teenth)
    assert_equal Date.parse("2013-10-13"), meetup
  end

  def test_first_monday_of_march_2013
    skip
    meetup = Meetup.new(3, 2013).day(:monday, :first)
    assert_equal Date.parse("2013-03-04"), meetup
  end

  def test_first_monday_of_april_2013
    skip
    meetup = Meetup.new(4, 2013).day(:monday, :first)
    assert_equal Date.parse("2013-04-01"), meetup
  end

  def test_first_tuesday_of_may_2013
    skip
    meetup = Meetup.new(5, 2013).day(:tuesday, :first)
    assert_equal Date.parse("2013-05-07"), meetup
  end

  def test_first_tuesday_of_june_2013
    skip
    meetup = Meetup.new(6, 2013).day(:tuesday, :first)
    assert_equal Date.parse("2013-06-04"), meetup
  end

  def test_first_wednesday_of_july_2013
    skip
    meetup = Meetup.new(7, 2013).day(:wednesday, :first)
    assert_equal Date.parse("2013-07-03"), meetup
  end

  def test_first_wednesday_of_august_2013
    skip
    meetup = Meetup.new(8, 2013).day(:wednesday, :first)
    assert_equal Date.parse("2013-08-07"), meetup
  end

  def test_first_thursday_of_september_2013
    skip
    meetup = Meetup.new(9, 2013).day(:thursday, :first)
    assert_equal Date.parse("2013-09-05"), meetup
  end

  def test_first_thursday_of_october_2013
    skip
    meetup = Meetup.new(10, 2013).day(:thursday, :first)
    assert_equal Date.parse("2013-10-03"), meetup
  end

  def test_first_friday_of_november_2013
    skip
    meetup = Meetup.new(11, 2013).day(:friday, :first)
    assert_equal Date.parse("2013-11-01"), meetup
  end

  def test_first_friday_of_december_2013
    skip
    meetup = Meetup.new(12, 2013).day(:friday, :first)
    assert_equal Date.parse("2013-12-06"), meetup
  end

  def test_first_saturday_of_january_2013
    skip
    meetup = Meetup.new(1, 2013).day(:saturday, :first)
    assert_equal Date.parse("2013-01-05"), meetup
  end

  def test_first_saturday_of_february_2013
    skip
    meetup = Meetup.new(2, 2013).day(:saturday, :first)
    assert_equal Date.parse("2013-02-02"), meetup
  end

  def test_first_sunday_of_march_2013
    skip
    meetup = Meetup.new(3, 2013).day(:sunday, :first)
    assert_equal Date.parse("2013-03-03"), meetup
  end

  def test_first_sunday_of_april_2013
    skip
    meetup = Meetup.new(4, 2013).day(:sunday, :first)
    assert_equal Date.parse("2013-04-07"), meetup
  end

  def test_second_monday_of_march_2013
    skip
    meetup = Meetup.new(3, 2013).day(:monday, :second)
    assert_equal Date.parse("2013-03-11"), meetup
  end

  def test_second_monday_of_april_2013
    skip
    meetup = Meetup.new(4, 2013).day(:monday, :second)
    assert_equal Date.parse("2013-04-08"), meetup
  end

  def test_second_tuesday_of_may_2013
    skip
    meetup = Meetup.new(5, 2013).day(:tuesday, :second)
    assert_equal Date.parse("2013-05-14"), meetup
  end

  def test_second_tuesday_of_june_2013
    skip
    meetup = Meetup.new(6, 2013).day(:tuesday, :second)
    assert_equal Date.parse("2013-06-11"), meetup
  end

  def test_second_wednesday_of_july_2013
    skip
    meetup = Meetup.new(7, 2013).day(:wednesday, :second)
    assert_equal Date.parse("2013-07-10"), meetup
  end

  def test_second_wednesday_of_august_2013
    skip
    meetup = Meetup.new(8, 2013).day(:wednesday, :second)
    assert_equal Date.parse("2013-08-14"), meetup
  end

  def test_second_thursday_of_september_2013
    skip
    meetup = Meetup.new(9, 2013).day(:thursday, :second)
    assert_equal Date.parse("2013-09-12"), meetup
  end

  def test_second_thursday_of_october_2013
    skip
    meetup = Meetup.new(10, 2013).day(:thursday, :second)
    assert_equal Date.parse("2013-10-10"), meetup
  end

  def test_second_friday_of_november_2013
    skip
    meetup = Meetup.new(11, 2013).day(:friday, :second)
    assert_equal Date.parse("2013-11-08"), meetup
  end

  def test_second_friday_of_december_2013
    skip
    meetup = Meetup.new(12, 2013).day(:friday, :second)
    assert_equal Date.parse("2013-12-13"), meetup
  end

  def test_second_saturday_of_january_2013
    skip
    meetup = Meetup.new(1, 2013).day(:saturday, :second)
    assert_equal Date.parse("2013-01-12"), meetup
  end

  def test_second_saturday_of_february_2013
    skip
    meetup = Meetup.new(2, 2013).day(:saturday, :second)
    assert_equal Date.parse("2013-02-09"), meetup
  end

  def test_second_sunday_of_march_2013
    skip
    meetup = Meetup.new(3, 2013).day(:sunday, :second)
    assert_equal Date.parse("2013-03-10"), meetup
  end

  def test_second_sunday_of_april_2013
    skip
    meetup = Meetup.new(4, 2013).day(:sunday, :second)
    assert_equal Date.parse("2013-04-14"), meetup
  end

  def test_third_monday_of_march_2013
    skip
    meetup = Meetup.new(3, 2013).day(:monday, :third)
    assert_equal Date.parse("2013-03-18"), meetup
  end

  def test_third_monday_of_april_2013
    skip
    meetup = Meetup.new(4, 2013).day(:monday, :third)
    assert_equal Date.parse("2013-04-15"), meetup
  end

  def test_third_tuesday_of_may_2013
    skip
    meetup = Meetup.new(5, 2013).day(:tuesday, :third)
    assert_equal Date.parse("2013-05-21"), meetup
  end

  def test_third_tuesday_of_june_2013
    skip
    meetup = Meetup.new(6, 2013).day(:tuesday, :third)
    assert_equal Date.parse("2013-06-18"), meetup
  end

  def test_third_wednesday_of_july_2013
    skip
    meetup = Meetup.new(7, 2013).day(:wednesday, :third)
    assert_equal Date.parse("2013-07-17"), meetup
  end

  def test_third_wednesday_of_august_2013
    skip
    meetup = Meetup.new(8, 2013).day(:wednesday, :third)
    assert_equal Date.parse("2013-08-21"), meetup
  end

  def test_third_thursday_of_september_2013
    skip
    meetup = Meetup.new(9, 2013).day(:thursday, :third)
    assert_equal Date.parse("2013-09-19"), meetup
  end

  def test_third_thursday_of_october_2013
    skip
    meetup = Meetup.new(10, 2013).day(:thursday, :third)
    assert_equal Date.parse("2013-10-17"), meetup
  end

  def test_third_friday_of_november_2013
    skip
    meetup = Meetup.new(11, 2013).day(:friday, :third)
    assert_equal Date.parse("2013-11-15"), meetup
  end

  def test_third_friday_of_december_2013
    skip
    meetup = Meetup.new(12, 2013).day(:friday, :third)
    assert_equal Date.parse("2013-12-20"), meetup
  end

  def test_third_saturday_of_january_2013
    skip
    meetup = Meetup.new(1, 2013).day(:saturday, :third)
    assert_equal Date.parse("2013-01-19"), meetup
  end

  def test_third_saturday_of_february_2013
    skip
    meetup = Meetup.new(2, 2013).day(:saturday, :third)
    assert_equal Date.parse("2013-02-16"), meetup
  end

  def test_third_sunday_of_march_2013
    skip
    meetup = Meetup.new(3, 2013).day(:sunday, :third)
    assert_equal Date.parse("2013-03-17"), meetup
  end

  def test_third_sunday_of_april_2013
    skip
    meetup = Meetup.new(4, 2013).day(:sunday, :third)
    assert_equal Date.parse("2013-04-21"), meetup
  end

  def test_fourth_monday_of_march_2013
    skip
    meetup = Meetup.new(3, 2013).day(:monday, :fourth)
    assert_equal Date.parse("2013-03-25"), meetup
  end

  def test_fourth_monday_of_april_2013
    skip
    meetup = Meetup.new(4, 2013).day(:monday, :fourth)
    assert_equal Date.parse("2013-04-22"), meetup
  end

  def test_fourth_tuesday_of_may_2013
    skip
    meetup = Meetup.new(5, 2013).day(:tuesday, :fourth)
    assert_equal Date.parse("2013-05-28"), meetup
  end

  def test_fourth_tuesday_of_june_2013
    skip
    meetup = Meetup.new(6, 2013).day(:tuesday, :fourth)
    assert_equal Date.parse("2013-06-25"), meetup
  end

  def test_fourth_wednesday_of_july_2013
    skip
    meetup = Meetup.new(7, 2013).day(:wednesday, :fourth)
    assert_equal Date.parse("2013-07-24"), meetup
  end

  def test_fourth_wednesday_of_august_2013
    skip
    meetup = Meetup.new(8, 2013).day(:wednesday, :fourth)
    assert_equal Date.parse("2013-08-28"), meetup
  end

  def test_fourth_thursday_of_september_2013
    skip
    meetup = Meetup.new(9, 2013).day(:thursday, :fourth)
    assert_equal Date.parse("2013-09-26"), meetup
  end

  def test_fourth_thursday_of_october_2013
    skip
    meetup = Meetup.new(10, 2013).day(:thursday, :fourth)
    assert_equal Date.parse("2013-10-24"), meetup
  end

  def test_fourth_friday_of_november_2013
    skip
    meetup = Meetup.new(11, 2013).day(:friday, :fourth)
    assert_equal Date.parse("2013-11-22"), meetup
  end

  def test_fourth_friday_of_december_2013
    skip
    meetup = Meetup.new(12, 2013).day(:friday, :fourth)
    assert_equal Date.parse("2013-12-27"), meetup
  end

  def test_fourth_saturday_of_january_2013
    skip
    meetup = Meetup.new(1, 2013).day(:saturday, :fourth)
    assert_equal Date.parse("2013-01-26"), meetup
  end

  def test_fourth_saturday_of_february_2013
    skip
    meetup = Meetup.new(2, 2013).day(:saturday, :fourth)
    assert_equal Date.parse("2013-02-23"), meetup
  end

  def test_fourth_sunday_of_march_2013
    skip
    meetup = Meetup.new(3, 2013).day(:sunday, :fourth)
    assert_equal Date.parse("2013-03-24"), meetup
  end

  def test_fourth_sunday_of_april_2013
    skip
    meetup = Meetup.new(4, 2013).day(:sunday, :fourth)
    assert_equal Date.parse("2013-04-28"), meetup
  end

  def test_last_monday_of_march_2013
    skip
    meetup = Meetup.new(3, 2013).day(:monday, :last)
    assert_equal Date.parse("2013-03-25"), meetup
  end

  def test_last_monday_of_april_2013
    skip
    meetup = Meetup.new(4, 2013).day(:monday, :last)
    assert_equal Date.parse("2013-04-29"), meetup
  end

  def test_last_tuesday_of_may_2013
    skip
    meetup = Meetup.new(5, 2013).day(:tuesday, :last)
    assert_equal Date.parse("2013-05-28"), meetup
  end

  def test_last_tuesday_of_june_2013
    skip
    meetup = Meetup.new(6, 2013).day(:tuesday, :last)
    assert_equal Date.parse("2013-06-25"), meetup
  end

  def test_last_wednesday_of_july_2013
    skip
    meetup = Meetup.new(7, 2013).day(:wednesday, :last)
    assert_equal Date.parse("2013-07-31"), meetup
  end

  def test_last_wednesday_of_august_2013
    skip
    meetup = Meetup.new(8, 2013).day(:wednesday, :last)
    assert_equal Date.parse("2013-08-28"), meetup
  end

  def test_last_thursday_of_september_2013
    skip
    meetup = Meetup.new(9, 2013).day(:thursday, :last)
    assert_equal Date.parse("2013-09-26"), meetup
  end

  def test_last_thursday_of_october_2013
    skip
    meetup = Meetup.new(10, 2013).day(:thursday, :last)
    assert_equal Date.parse("2013-10-31"), meetup
  end

  def test_last_friday_of_november_2013
    skip
    meetup = Meetup.new(11, 2013).day(:friday, :last)
    assert_equal Date.parse("2013-11-29"), meetup
  end

  def test_last_friday_of_december_2013
    skip
    meetup = Meetup.new(12, 2013).day(:friday, :last)
    assert_equal Date.parse("2013-12-27"), meetup
  end

  def test_last_saturday_of_january_2013
    skip
    meetup = Meetup.new(1, 2013).day(:saturday, :last)
    assert_equal Date.parse("2013-01-26"), meetup
  end

  def test_last_saturday_of_february_2013
    skip
    meetup = Meetup.new(2, 2013).day(:saturday, :last)
    assert_equal Date.parse("2013-02-23"), meetup
  end

  def test_last_sunday_of_march_2013
    skip
    meetup = Meetup.new(3, 2013).day(:sunday, :last)
    assert_equal Date.parse("2013-03-31"), meetup
  end

  def test_last_sunday_of_april_2013
    skip
    meetup = Meetup.new(4, 2013).day(:sunday, :last)
    assert_equal Date.parse("2013-04-28"), meetup
  end

  def test_last_wednesday_of_february_2012
    skip
    meetup = Meetup.new(2, 2012).day(:wednesday, :last)
    assert_equal Date.parse("2012-02-29"), meetup
  end

  def test_last_wednesday_of_december_2014
    skip
    meetup = Meetup.new(12, 2014).day(:wednesday, :last)
    assert_equal Date.parse("2014-12-31"), meetup
  end

  def test_last_sunday_of_february_2015
    skip
    meetup = Meetup.new(2, 2015).day(:sunday, :last)
    assert_equal Date.parse("2015-02-22"), meetup
  end

  def test_first_friday_of_december_2012
    skip
    meetup = Meetup.new(12, 2012).day(:friday, :first)
    assert_equal Date.parse("2012-12-07"), meetup
  end
  # rubocop:enable Naming/VariableNumber
end
