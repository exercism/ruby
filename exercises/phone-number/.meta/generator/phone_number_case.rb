require 'generator/exercise_case'

class PhoneNumberCase < Generator::ExerciseCase
  def workload
     assert_equal(expected, "PhoneNumber.clean(#{phrase.inspect})")
  end
end
