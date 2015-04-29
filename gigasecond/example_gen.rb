#!/usr/bin/env ruby
require 'json'
require 'date'

PREFIX="require 'minitest/autorun'
require 'date'
require 'time'

require_relative 'gigasecond'
class GigasecondTest < Minitest::Test
"

SUFFIX=
'
  #modify the test to test your 1 Gs anniversary
  def test_with_your_birthday
    skip("Keep")
    your_birthday = Time.utc(year, month, day)
    gs = Gigasecond.from(your_birthday)
    assert_equal Time.utc(2009, 1, 31, 1, 46, 39), gs
  end
end
'

def read_test_cases
  json_text = File.read "../../x-common/gigasecond.json"
  tests = JSON.parse json_text
  tests["add"]["cases"]
end

def main
  test_cases = read_test_cases
  test_methods_code = ""
  test_cases.each{|test_case|
    test_methods_code += test_method_for test_case
  }

  # The first test should not be skipped,
  # but it should fail,
  # before the solver starts to implement it
  test_methods_code.sub! "    skip\n", ""

  test_code = PREFIX + test_methods_code + SUFFIX
  File.write("gigasecond_test.rb", test_code)
end

def convert_time(time_text)
  date_time = DateTime.parse time_text
  if date_time.hour > 0 || date_time.minute > 0 || date_time.day > 0
    "Time.utc(#{date_time.year}, #{date_time.month}, #{date_time.day}, #{date_time.hour}, #{date_time.minute}, #{date_time.second})"
  else
    "Time.utc(#{date_time.year}, #{date_time.month}, #{date_time.day})"
  end
end

def test_method_for(test_case)
  description = test_case["#"] || test_case["input"]
  test_name = description.gsub(/[ -]/, "_").gsub(":","_")
  executed_code = "gs = Gigasecond.from(#{convert_time test_case['input']})"
  assertion ="assert_equal #{convert_time test_case['expected']}, gs"
  "
  def test_#{test_name}
    skip
    #{executed_code}
    #{assertion}
  end
"
end

main
