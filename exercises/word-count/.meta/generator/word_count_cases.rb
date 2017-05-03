require 'generator/exercise_case'

class WordCountCase < Generator::ExerciseCase

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
