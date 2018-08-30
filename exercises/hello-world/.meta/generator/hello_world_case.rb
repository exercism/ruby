require 'generator/exercise_case'

class HelloWorldCase < Generator::ExerciseCase
  def workload
    assert_equal(expected, "HelloWorld.hello")
  end
end
