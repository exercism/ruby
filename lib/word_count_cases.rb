require 'exercise_cases'

class WordCountCase < ExerciseCase

  def object_under_test
    %Q(Phrase.new(#{input.inspect}))
  end

end
