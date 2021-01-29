require 'generator/exercise_case'

class DominoesCase < Generator::ExerciseCase
  def description
    super.gsub("can't", 'can not')
  end

  def workload
    [
      "dominoes = #{dominoes}\n",
      assert_or_refute(expected, "Dominoes.chain?(dominoes)")
    ].join
  end
end
