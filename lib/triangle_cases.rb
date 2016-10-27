class TriangleCase < OpenStruct
  def test_name
    initial = description.downcase
    replaced = initial.gsub(/(true|false)/, replacements)
    if initial.eql?(replaced) && !initial.include?(triangle)
      replaced = triangle + ' triangle ' + initial
    end
    'test_%s' % replaced.tr_s(', -', '_')
  end

  def replacements
    booleans = { 'true' => '', 'false' => '' }
    booleans.each { |k, v| booleans[k] = expected_type(k) }
  end

  def workload
    [
      "triangle = Triangle.new(#{sides})",
      indent("#{assert_or_refute} triangle.#{triangle}?, #{failure_message}")
    ].join("\n")
  end

  def indent(line)
    ' ' * 4 + line
  end

  def assert_or_refute
    expected ? 'assert' : 'refute'
  end

  def failure_message
    %Q("Expected '#{expected}', #{expected_type}.")
  end

  def expected_type(boolean = nil)
    boolean ||= expected
    "triangle is #{boolean_check(boolean) ? '' : 'not '}#{triangle}"
  end

  def boolean_check(boolean)
    return true if boolean == true || boolean == 'true'
    false
  end

  def skipped
    index.zero? ? '# skip' : 'skip'
  end
end

TriangleCases = proc do |data|
  i = 0
  cases = []
  data = JSON.parse(data).select { |key, value| key.to_s.match(/[^#]+/) }
  data.keys.each do |triangle|
    data[triangle]['cases'].each do |row|
      row = row.merge(row.merge('index' => i, 'triangle' => triangle))
      cases << TriangleCase.new(row)
      i += 1
    end
  end
  cases
end
