require 'generator/exercise_cases'

class TriangleCase < Generator::ExerciseCase
  def name
    initial = description.downcase
    replaced = initial.gsub(/(true|false)/, expected_type)
    if initial.eql?(replaced) && !initial.include?(property)
      replaced = property + ' triangle ' + initial
    end
    'test_%s' % replaced.tr_s(', -', '_')
  end

  def workload
    [
      "triangle = Triangle.new(#{sides})",
      indent("#{assert} triangle.#{property}?, #{failure_message}")
    ].join("\n")
  end

  private

  def indent(line)
    ' ' * 4 + line
  end

  def failure_message
    %Q("Expected '#{expected}', #{expected_type}.")
  end

  def expected_type
    "triangle is #{expected ? '' : 'not '}#{property}"
  end

end
