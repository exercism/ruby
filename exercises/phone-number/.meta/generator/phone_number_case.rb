require 'generator/exercise_case'

class PhoneNumberCase < Generator::ExerciseCase
  def workload
     assert_equal { "PhoneNumber.clean(#{phrase.inspect})" }
  end
end
