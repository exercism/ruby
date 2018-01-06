require 'minitest/autorun'
require_relative 'meetup'

# Common test data version: 1.0.0 fe9630e
class MeetupTest < Minitest::Test
  def test_monteenth_of_may_2013
    # skip
    assert_equal Date.new(2013, 5, 13),
      Meetup.new("Teenth Monday of May, 2013").to_date
  end

  def test_monteenth_of_august_2013
    skip
    assert_equal Date.new(2013, 8, 19),
      Meetup.new("Teenth Monday of August, 2013").to_date
  end

  def test_monteenth_of_september_2013
    skip
    assert_equal Date.new(2013, 9, 16),
      Meetup.new("Teenth Monday of September, 2013").to_date
  end

  def test_tuesteenth_of_march_2013
    skip
    assert_equal Date.new(2013, 3, 19),
      Meetup.new("Teenth Tuesday of March, 2013").to_date
  end

  def test_tuesteenth_of_april_2013
    skip
    assert_equal Date.new(2013, 4, 16),
      Meetup.new("Teenth Tuesday of April, 2013").to_date
  end

  def test_tuesteenth_of_august_2013
    skip
    assert_equal Date.new(2013, 8, 13),
      Meetup.new("Teenth Tuesday of August, 2013").to_date
  end

  def test_wednesteenth_of_january_2013
    skip
    assert_equal Date.new(2013, 1, 16),
      Meetup.new("Teenth Wednesday of January, 2013").to_date
  end

  def test_wednesteenth_of_february_2013
    skip
    assert_equal Date.new(2013, 2, 13),
      Meetup.new("Teenth Wednesday of February, 2013").to_date
  end

  def test_wednesteenth_of_june_2013
    skip
    assert_equal Date.new(2013, 6, 19),
      Meetup.new("Teenth Wednesday of June, 2013").to_date
  end

  def test_thursteenth_of_may_2013
    skip
    assert_equal Date.new(2013, 5, 16),
      Meetup.new("Teenth Thursday of May, 2013").to_date
  end

  def test_thursteenth_of_june_2013
    skip
    assert_equal Date.new(2013, 6, 13),
      Meetup.new("Teenth Thursday of June, 2013").to_date
  end

  def test_thursteenth_of_september_2013
    skip
    assert_equal Date.new(2013, 9, 19),
      Meetup.new("Teenth Thursday of September, 2013").to_date
  end

  def test_friteenth_of_april_2013
    skip
    assert_equal Date.new(2013, 4, 19),
      Meetup.new("Teenth Friday of April, 2013").to_date
  end

  def test_friteenth_of_august_2013
    skip
    assert_equal Date.new(2013, 8, 16),
      Meetup.new("Teenth Friday of August, 2013").to_date
  end

  def test_friteenth_of_september_2013
    skip
    assert_equal Date.new(2013, 9, 13),
      Meetup.new("Teenth Friday of September, 2013").to_date
  end

  def test_saturteenth_of_february_2013
    skip
    assert_equal Date.new(2013, 2, 16),
      Meetup.new("Teenth Saturday of February, 2013").to_date
  end

  def test_saturteenth_of_april_2013
    skip
    assert_equal Date.new(2013, 4, 13),
      Meetup.new("Teenth Saturday of April, 2013").to_date
  end

  def test_saturteenth_of_october_2013
    skip
    assert_equal Date.new(2013, 10, 19),
      Meetup.new("Teenth Saturday of October, 2013").to_date
  end

  def test_sunteenth_of_may_2013
    skip
    assert_equal Date.new(2013, 5, 19),
      Meetup.new("Teenth Sunday of May, 2013").to_date
  end

  def test_sunteenth_of_june_2013
    skip
    assert_equal Date.new(2013, 6, 16),
      Meetup.new("Teenth Sunday of June, 2013").to_date
  end

  def test_sunteenth_of_october_2013
    skip
    assert_equal Date.new(2013, 10, 13),
      Meetup.new("Teenth Sunday of October, 2013").to_date
  end

  def test_first_monday_of_march_2013
    skip
    assert_equal Date.new(2013, 3, 4),
      Meetup.new("First Monday of March, 2013").to_date
  end

  def test_first_monday_of_april_2013
    skip
    assert_equal Date.new(2013, 4, 1),
      Meetup.new("First Monday of April, 2013").to_date
  end

  def test_first_tuesday_of_may_2013
    skip
    assert_equal Date.new(2013, 5, 7),
      Meetup.new("First Tuesday of May, 2013").to_date
  end

  def test_first_tuesday_of_june_2013
    skip
    assert_equal Date.new(2013, 6, 4),
      Meetup.new("First Tuesday of June, 2013").to_date
  end

  def test_first_wednesday_of_july_2013
    skip
    assert_equal Date.new(2013, 7, 3),
      Meetup.new("First Wednesday of July, 2013").to_date
  end

  def test_first_wednesday_of_august_2013
    skip
    assert_equal Date.new(2013, 8, 7),
      Meetup.new("First Wednesday of August, 2013").to_date
  end

  def test_first_thursday_of_september_2013
    skip
    assert_equal Date.new(2013, 9, 5),
      Meetup.new("First Thursday of September, 2013").to_date
  end

  def test_first_thursday_of_october_2013
    skip
    assert_equal Date.new(2013, 10, 3),
      Meetup.new("First Thursday of October, 2013").to_date
  end

  def test_first_friday_of_november_2013
    skip
    assert_equal Date.new(2013, 11, 1),
      Meetup.new("First Friday of November, 2013").to_date
  end

  def test_first_friday_of_december_2013
    skip
    assert_equal Date.new(2013, 12, 6),
      Meetup.new("First Friday of December, 2013").to_date
  end

  def test_first_saturday_of_january_2013
    skip
    assert_equal Date.new(2013, 1, 5),
      Meetup.new("First Saturday of January, 2013").to_date
  end

  def test_first_saturday_of_february_2013
    skip
    assert_equal Date.new(2013, 2, 2),
      Meetup.new("First Saturday of February, 2013").to_date
  end

  def test_first_sunday_of_march_2013
    skip
    assert_equal Date.new(2013, 3, 3),
      Meetup.new("First Sunday of March, 2013").to_date
  end

  def test_first_sunday_of_april_2013
    skip
    assert_equal Date.new(2013, 4, 7),
      Meetup.new("First Sunday of April, 2013").to_date
  end

  def test_second_monday_of_march_2013
    skip
    assert_equal Date.new(2013, 3, 11),
      Meetup.new("Second Monday of March, 2013").to_date
  end

  def test_second_monday_of_april_2013
    skip
    assert_equal Date.new(2013, 4, 8),
      Meetup.new("Second Monday of April, 2013").to_date
  end

  def test_second_tuesday_of_may_2013
    skip
    assert_equal Date.new(2013, 5, 14),
      Meetup.new("Second Tuesday of May, 2013").to_date
  end

  def test_second_tuesday_of_june_2013
    skip
    assert_equal Date.new(2013, 6, 11),
      Meetup.new("Second Tuesday of June, 2013").to_date
  end

  def test_second_wednesday_of_july_2013
    skip
    assert_equal Date.new(2013, 7, 10),
      Meetup.new("Second Wednesday of July, 2013").to_date
  end

  def test_second_wednesday_of_august_2013
    skip
    assert_equal Date.new(2013, 8, 14),
      Meetup.new("Second Wednesday of August, 2013").to_date
  end

  def test_second_thursday_of_september_2013
    skip
    assert_equal Date.new(2013, 9, 12),
      Meetup.new("Second Thursday of September, 2013").to_date
  end

  def test_second_thursday_of_october_2013
    skip
    assert_equal Date.new(2013, 10, 10),
      Meetup.new("Second Thursday of October, 2013").to_date
  end

  def test_second_friday_of_november_2013
    skip
    assert_equal Date.new(2013, 11, 8),
      Meetup.new("Second Friday of November, 2013").to_date
  end

  def test_second_friday_of_december_2013
    skip
    assert_equal Date.new(2013, 12, 13),
      Meetup.new("Second Friday of December, 2013").to_date
  end

  def test_second_saturday_of_january_2013
    skip
    assert_equal Date.new(2013, 1, 12),
      Meetup.new("Second Saturday of January, 2013").to_date
  end

  def test_second_saturday_of_february_2013
    skip
    assert_equal Date.new(2013, 2, 9),
      Meetup.new("Second Saturday of February, 2013").to_date
  end

  def test_second_sunday_of_march_2013
    skip
    assert_equal Date.new(2013, 3, 10),
      Meetup.new("Second Sunday of March, 2013").to_date
  end

  def test_second_sunday_of_april_2013
    skip
    assert_equal Date.new(2013, 4, 14),
      Meetup.new("Second Sunday of April, 2013").to_date
  end

  def test_third_monday_of_march_2013
    skip
    assert_equal Date.new(2013, 3, 18),
      Meetup.new("Third Monday of March, 2013").to_date
  end

  def test_third_monday_of_april_2013
    skip
    assert_equal Date.new(2013, 4, 15),
      Meetup.new("Third Monday of April, 2013").to_date
  end

  def test_third_tuesday_of_may_2013
    skip
    assert_equal Date.new(2013, 5, 21),
      Meetup.new("Third Tuesday of May, 2013").to_date
  end

  def test_third_tuesday_of_june_2013
    skip
    assert_equal Date.new(2013, 6, 18),
      Meetup.new("Third Tuesday of June, 2013").to_date
  end

  def test_third_wednesday_of_july_2013
    skip
    assert_equal Date.new(2013, 7, 17),
      Meetup.new("Third Wednesday of July, 2013").to_date
  end

  def test_third_wednesday_of_august_2013
    skip
    assert_equal Date.new(2013, 8, 21),
      Meetup.new("Third Wednesday of August, 2013").to_date
  end

  def test_third_thursday_of_september_2013
    skip
    assert_equal Date.new(2013, 9, 19),
      Meetup.new("Third Thursday of September, 2013").to_date
  end

  def test_third_thursday_of_october_2013
    skip
    assert_equal Date.new(2013, 10, 17),
      Meetup.new("Third Thursday of October, 2013").to_date
  end

  def test_third_friday_of_november_2013
    skip
    assert_equal Date.new(2013, 11, 15),
      Meetup.new("Third Friday of November, 2013").to_date
  end

  def test_third_friday_of_december_2013
    skip
    assert_equal Date.new(2013, 12, 20),
      Meetup.new("Third Friday of December, 2013").to_date
  end

  def test_third_saturday_of_january_2013
    skip
    assert_equal Date.new(2013, 1, 19),
      Meetup.new("Third Saturday of January, 2013").to_date
  end

  def test_third_saturday_of_february_2013
    skip
    assert_equal Date.new(2013, 2, 16),
      Meetup.new("Third Saturday of February, 2013").to_date
  end

  def test_third_sunday_of_march_2013
    skip
    assert_equal Date.new(2013, 3, 17),
      Meetup.new("Third Sunday of March, 2013").to_date
  end

  def test_third_sunday_of_april_2013
    skip
    assert_equal Date.new(2013, 4, 21),
      Meetup.new("Third Sunday of April, 2013").to_date
  end

  def test_fourth_monday_of_march_2013
    skip
    assert_equal Date.new(2013, 3, 25),
      Meetup.new("Fourth Monday of March, 2013").to_date
  end

  def test_fourth_monday_of_april_2013
    skip
    assert_equal Date.new(2013, 4, 22),
      Meetup.new("Fourth Monday of April, 2013").to_date
  end

  def test_fourth_tuesday_of_may_2013
    skip
    assert_equal Date.new(2013, 5, 28),
      Meetup.new("Fourth Tuesday of May, 2013").to_date
  end

  def test_fourth_tuesday_of_june_2013
    skip
    assert_equal Date.new(2013, 6, 25),
      Meetup.new("Fourth Tuesday of June, 2013").to_date
  end

  def test_fourth_wednesday_of_july_2013
    skip
    assert_equal Date.new(2013, 7, 24),
      Meetup.new("Fourth Wednesday of July, 2013").to_date
  end

  def test_fourth_wednesday_of_august_2013
    skip
    assert_equal Date.new(2013, 8, 28),
      Meetup.new("Fourth Wednesday of August, 2013").to_date
  end

  def test_fourth_thursday_of_september_2013
    skip
    assert_equal Date.new(2013, 9, 26),
      Meetup.new("Fourth Thursday of September, 2013").to_date
  end

  def test_fourth_thursday_of_october_2013
    skip
    assert_equal Date.new(2013, 10, 24),
      Meetup.new("Fourth Thursday of October, 2013").to_date
  end

  def test_fourth_friday_of_november_2013
    skip
    assert_equal Date.new(2013, 11, 22),
      Meetup.new("Fourth Friday of November, 2013").to_date
  end

  def test_fourth_friday_of_december_2013
    skip
    assert_equal Date.new(2013, 12, 27),
      Meetup.new("Fourth Friday of December, 2013").to_date
  end

  def test_fourth_saturday_of_january_2013
    skip
    assert_equal Date.new(2013, 1, 26),
      Meetup.new("Fourth Saturday of January, 2013").to_date
  end

  def test_fourth_saturday_of_february_2013
    skip
    assert_equal Date.new(2013, 2, 23),
      Meetup.new("Fourth Saturday of February, 2013").to_date
  end

  def test_fourth_sunday_of_march_2013
    skip
    assert_equal Date.new(2013, 3, 24),
      Meetup.new("Fourth Sunday of March, 2013").to_date
  end

  def test_fourth_sunday_of_april_2013
    skip
    assert_equal Date.new(2013, 4, 28),
      Meetup.new("Fourth Sunday of April, 2013").to_date
  end

  def test_last_monday_of_march_2013
    skip
    assert_equal Date.new(2013, 3, 25),
      Meetup.new("Last Monday of March, 2013").to_date
  end

  def test_last_monday_of_april_2013
    skip
    assert_equal Date.new(2013, 4, 29),
      Meetup.new("Last Monday of April, 2013").to_date
  end

  def test_last_tuesday_of_may_2013
    skip
    assert_equal Date.new(2013, 5, 28),
      Meetup.new("Last Tuesday of May, 2013").to_date
  end

  def test_last_tuesday_of_june_2013
    skip
    assert_equal Date.new(2013, 6, 25),
      Meetup.new("Last Tuesday of June, 2013").to_date
  end

  def test_last_wednesday_of_july_2013
    skip
    assert_equal Date.new(2013, 7, 31),
      Meetup.new("Last Wednesday of July, 2013").to_date
  end

  def test_last_wednesday_of_august_2013
    skip
    assert_equal Date.new(2013, 8, 28),
      Meetup.new("Last Wednesday of August, 2013").to_date
  end

  def test_last_thursday_of_september_2013
    skip
    assert_equal Date.new(2013, 9, 26),
      Meetup.new("Last Thursday of September, 2013").to_date
  end

  def test_last_thursday_of_october_2013
    skip
    assert_equal Date.new(2013, 10, 31),
      Meetup.new("Last Thursday of October, 2013").to_date
  end

  def test_last_friday_of_november_2013
    skip
    assert_equal Date.new(2013, 11, 29),
      Meetup.new("Last Friday of November, 2013").to_date
  end

  def test_last_friday_of_december_2013
    skip
    assert_equal Date.new(2013, 12, 27),
      Meetup.new("Last Friday of December, 2013").to_date
  end

  def test_last_saturday_of_january_2013
    skip
    assert_equal Date.new(2013, 1, 26),
      Meetup.new("Last Saturday of January, 2013").to_date
  end

  def test_last_saturday_of_february_2013
    skip
    assert_equal Date.new(2013, 2, 23),
      Meetup.new("Last Saturday of February, 2013").to_date
  end

  def test_last_sunday_of_march_2013
    skip
    assert_equal Date.new(2013, 3, 31),
      Meetup.new("Last Sunday of March, 2013").to_date
  end

  def test_last_sunday_of_april_2013
    skip
    assert_equal Date.new(2013, 4, 28),
      Meetup.new("Last Sunday of April, 2013").to_date
  end

  def test_last_wednesday_of_february_2012
    skip
    assert_equal Date.new(2012, 2, 29),
      Meetup.new("Last Wednesday of February, 2012").to_date
  end

  def test_last_wednesday_of_december_2014
    skip
    assert_equal Date.new(2014, 12, 31),
      Meetup.new("Last Wednesday of December, 2014").to_date
  end

  def test_last_sunday_of_february_2015
    skip
    assert_equal Date.new(2015, 2, 22),
      Meetup.new("Last Sunday of February, 2015").to_date
  end

  def test_first_friday_of_december_2012
    skip
    assert_equal Date.new(2012, 12, 7),
      Meetup.new("First Friday of December, 2012").to_date
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
  #   VERSION = 1 # Where the version number matches the one in the test.
  # end
  #
  # If you are curious, read more about constants on RubyDoc:
  # http://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/constants.html

  def test_bookkeeping
    skip
    assert_equal 1, BookKeeping::VERSION
  end

  def test_last_wednesday_of_february_2012
    skip
    assert_equal Date.new(2012, 2, 29),
      Meetup.new(2, 2012).day(:wednesday, :last)
  end

  def test_last_wednesday_of_december_2014
    skip
    assert_equal Date.new(2014, 12, 31),
      Meetup.new(12, 2014).day(:wednesday, :last)
  end

  def test_last_sunday_of_february_2015
    skip
    assert_equal Date.new(2015, 2, 22),
      Meetup.new(2, 2015).day(:sunday, :last)
  end

  def test_first_friday_of_december_2012
    skip
    assert_equal Date.new(2012, 12, 7),
      Meetup.new(12, 2012).day(:friday, :first)
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
  #   VERSION = 1 # Where the version number matches the one in the test.
  # end
  #
  # If you are curious, read more about constants on RubyDoc:
  # http://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/constants.html

  def test_bookkeeping
    skip
    assert_equal 1, BookKeeping::VERSION
  end
end
