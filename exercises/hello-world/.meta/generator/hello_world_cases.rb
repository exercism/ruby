require 'generator/exercise_cases'

class HelloWorldCase < Generator::ExerciseCase

  def workload
    assert_equal { "HelloWorld.hello" }
  end

end
