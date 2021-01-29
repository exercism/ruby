require 'generator/exercise_case'

class TwoFerCase < Generator::ExerciseCase
  def workload
    if name.nil?
      assert_equal(expected, "TwoFer.two_fer")
    else
      assert_equal(expected, "TwoFer.two_fer(#{name.inspect})")
    end
  end
end
