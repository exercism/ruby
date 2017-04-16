require 'exercise_cases'

class HelloWorldCase < OpenStruct
  def test_name
    'test_%s' % property.gsub(/[ -]/, '_')
  end

  def workload
    "assert_equal '#{expected}', #{self.do}"
  end

  def do
    'HelloWorld.hello'
  end

  def skipped?
    index > 0
  end
end

HelloWorldCases = proc do |data|
  JSON.parse(data)['cases'].map.with_index do |row, i|
    HelloWorldCase.new(row.merge('index' => i))
  end
end
