require 'generator/exercise_cases'

class WordCountCase < ExerciseCase

  def workload
    indent_lines([
      "phrase = #{object_under_test}",
      "counts = #{expected}",
      "assert_equal counts, phrase.word_count"
    ], 4)

  end

  private

  def object_under_test
    %Q(Phrase.new(#{input.inspect}))
  end

end
