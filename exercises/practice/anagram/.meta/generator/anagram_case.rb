require 'generator/exercise_case'

class AnagramCase < Generator::ExerciseCase

  def workload
    [show_comment, detector, anagram, wanted, assert].join
  end

  private

  def indent_lines(code, indent = 2)
    code.join("\n" + ' '*2*indent)
  end

  def show_comment
    "# #{comment}\n" if respond_to?(:comment)
  end

  def detector
    "detector = Anagram.new('#{subject}')\n"
  end

  def anagram
    "anagrams = detector.match(#{candidates})\n"
  end

  def wanted
    "expected = #{expected.sort}\n"
  end

  def assert
    actual = expected.size > 1 ? 'anagrams.sort' : 'anagrams'
    "assert_equal expected, #{actual}\n"
  end

end
