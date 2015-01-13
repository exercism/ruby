  class Date
  def g_second(year,month,day)
    gs= Time.mktime(year,month,day)
    puts later_time = gs + 10**9
  end
end

foo = Date.new
foo.g_second(1977,6,13)


