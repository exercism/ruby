require 'exercise_cases'

class AnagramCase < ExerciseCase

  def workload
    %Q(assert_equal #{expected.sort}, Anagram.new('#{subject}').match(#{candidates}).sort)
  end

end
