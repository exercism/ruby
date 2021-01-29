require 'generator/exercise_case'

class FlattenArrayCase < Generator::ExerciseCase
  def description
    super.gsub(/null/,'nil')
  end

  def workload
    [
      "flat_array = FlattenArray.flatten(#{input_array})",
      "assert_equal #{expected}, flat_array"
    ]
  end
end
