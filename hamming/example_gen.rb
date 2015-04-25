require 'json'

PREFIX_PART1="require 'minitest/autorun'
begin
  require_relative 'hamming'
rescue LoadError => e"
PREFIX_PART2 ='
  puts "\n\n#{e.backtrace.first} #{e.message}"
  puts DATA.read
  exit 1
end

class HammingTest < Minitest::Test
'

SUFFIX="end

__END__

*****************************************************
You got an error, which is exactly as it should be.
This is the first step in the Test-Driven Development
(TDD) process.

The most important part of the error is

      cannot load such file

It's looking for a file named hamming.rb that doesn't
exist yet.

To fix the error, create an empty file named hamming.rb
in the same directory as the hamming_test.rb file.

Then run the test again.

For more guidance as you work on this exercise, see
GETTING_STARTED.md.
*****************************************************
"

def read_test_cases
  json_text = File.read "../../x-common/hamming.json"
  tests = JSON.parse json_text
  tests["cases"]
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

  test_code = PREFIX_PART1 + PREFIX_PART2 + test_methods_code + SUFFIX
  File.write("hamming_test.rb", test_code)
end

def test_method_for test_case
  test_name = test_case['description'].gsub(/[ -]/, "_")
  executed_code = "Hamming.compute('#{test_case['strand1']}', '#{test_case['strand2']}')"
  if test_case['expected'] > -1
    assertion ="assert_equal #{test_case['expected']}, #{executed_code}"
  else
    assertion = "assert_raises(ArgumentError){ #{executed_code} }"
  end
  
  "
  def test_#{test_name}
    skip
    #{assertion}
  end
"
end

main
