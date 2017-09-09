require 'generator/exercise_case'

class SublistCase < Generator::ExerciseCase

  def workload
    assert_equal { "Sublist.compare(#{listOne}, #{listTwo})" }
  end

end
