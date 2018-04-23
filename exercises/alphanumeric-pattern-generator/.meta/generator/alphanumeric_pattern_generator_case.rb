require 'generator/exercise_case'

class AlphanumericPatternGeneratorCase < Generator::ExerciseCase

  def workload
    "#{assert} Problem.call(#{input.inspect})"
  end

end
