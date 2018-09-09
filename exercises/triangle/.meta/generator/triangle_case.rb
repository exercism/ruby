require 'generator/exercise_case'

class TriangleCase < Generator::ExerciseCase
  def description
    initial = super.downcase
    replaced = initial.gsub(/(true|false)/, "triangle is #{type}")

    return replaced unless initial == replaced # no change
    return replaced if replaced.include?(property)
    return "#{property} triangle " + replaced
  end

  def workload
    [
      "triangle = Triangle.new(#{sides})",
      assert_or_refute(expected, "triangle.#{property}?, #{failure_message}")
    ]
  end

  private

  def failure_message
    %Q("Expected '#{expected}', triangle #{sides} is #{type}.")
  end

  def type
    (expected ? '' : 'not ') + property
  end
end
