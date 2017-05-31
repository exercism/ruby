require 'generator/exercise_case'

class AnagramCase < Generator::ExerciseCase

  def workload
    indent_lines([show_comment, detector, anagram, wanted, assert].compact)
  end

  private

  def indent_lines(code, indent = 2)
    code.join("\n" + ' '*2*indent)
  end

  def show_comment
    "# #{comment}" if respond_to?(:comment)
  end

  def detector
    "detector = Anagram.new('#{subject}')"
  end

  def anagram
    "anagrams = detector.match(#{candidates})"
  end

  def wanted
    "expected = #{expected.sort}"
  end

  def assert
    actual = expected.size > 1 ? 'anagrams.sort' : 'anagrams'
    "assert_equal expected, #{actual}"
  end

end
