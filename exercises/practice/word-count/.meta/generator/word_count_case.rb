require 'generator/exercise_case'

class WordCountCase < Generator::ExerciseCase
  def workload
    [
      "phrase = WordCount.new(#{sentence.inspect})",
      "counts = #{expected}",
      "assert_equal counts, phrase.word_count"
    ]
  end
end
