require 'date'

module BookKeeping
  VERSION = 1
end

class Meetup

  SCHEDULE_FILTERS = {
    "First"  => Proc.new { |dates| dates.first },
    "Second" => Proc.new { |dates| dates[1] },
    "Third"  => Proc.new { |dates| dates[2] },
    "Fourth" => Proc.new { |dates| dates[3] },
    "Last"   => Proc.new { |dates| dates.last },
    "Teenth" => Proc.new do |dates|
      dates.find { |date| date.day.between?(13, 19) }
    end,
  }
  WHEN_FORMAT = /\A(#{SCHEDULE_FILTERS.keys.join("|")}) (#{Date::DAYNAMES.join("|")}) of (#{Date::MONTHNAMES.join("|")}), (\d+)\Z/

  def initialize(when_string)
    match = when_string.match(WHEN_FORMAT)
    if match
      @schedule, @weekday_name, month_name, year = match.captures
      @month = Date::MONTHNAMES.index(month_name)
      @year = Integer(year)
    else
      raise ArgumentError, "invalid Meetup description"
    end
  end

  def to_date
    @date ||= (
      matching_weekdays = days_of_the_month.select do |date|
        date.public_send("#{@weekday_name.downcase}?")
      end
      SCHEDULE_FILTERS.fetch(@schedule).call(matching_weekdays)
    )
  end

  private

  def days_of_the_month
    Date.new(@year, @month, 1)..Date.new(@year, @month, -1)
  end
end
