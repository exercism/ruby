require 'exercise_cases'

class HelloWorldCase < ExerciseCase

  def workload
    assert_equal { "HelloWorld.hello" }
  end

end
