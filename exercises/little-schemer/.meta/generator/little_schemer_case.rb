require 'generator/exercise_case'

class LittleSchemerCase < Generator::ExerciseCase
  def workload
    send('test_' + "#{property}")
  end

  private

  def arrange
    "list = #{input["list"]}"
  end

  def test_case
    "#{input["function"]}(list)"
  end

  def test_boolean
    %Q{#{arrange}
    #{assert} #{test_case}}
  end

  def test_exception
    %Q{#{arrange}
    assert_raises ArgumentError do
      #{test_case}
    end}
  end

  def test_equality
    %Q{#{arrange}
    assert_equal #{test_case}, #{expected}}
  end
end
