require 'generator/exercise_case'

class SublistCase < Generator::ExerciseCase

  def workload
    assert_equal { "Sublist.sublist(#{listOne}, #{listTwo})" }
  end

end
