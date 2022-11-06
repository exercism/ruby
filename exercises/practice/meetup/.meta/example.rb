require 'date'

class Meetup
  def self.days_of_week
    [:sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday]
  end

  def self.weekday_number(weekday)
    days_of_week.index(weekday)
  end

  DAYS_IN_WEEK = 7
  private_constant :DAYS_IN_WEEK

  private

  attr_reader :year,
              :number,
              :first,
              :eighth,
              :thirteenth,
              :fifteenth,
              :twenty_second,
              :last

  def initialize(number, year)
    @year          = year
    @number        = number
    @first         = Date.new(year, number, 1)
    @eighth        = Date.new(year, number, 8)
    @thirteenth    = Date.new(year, number, 13)
    @fifteenth     = Date.new(year, number, 15)
    @twenty_second = Date.new(year, number, 22)
    @last          = Date.new(year, number, -1)
  end

  def days_til(weekday, day)
    (self.class.weekday_number(weekday) - day.wday) % DAYS_IN_WEEK
  end

  public

  def day(weekday, schedule)
    case schedule
    when :teenth
      thirteenth + days_til(weekday, thirteenth)
    when :first
      first + days_til(weekday, first)
    when :second
      eighth + days_til(weekday, eighth)
    when :third
      fifteenth + days_til(weekday, fifteenth)
    when :fourth
      twenty_second + days_til(weekday, twenty_second)
    when :last
      last - (DAYS_IN_WEEK - (self.class.weekday_number(weekday) - last.wday)) %
        DAYS_IN_WEEK
    end
  end

end
