class HelloWorldCase < OpenStruct
  def test_name
    'test_%s' % description.gsub(/[ -]/, '_')
  end

  def do
    defined?(name) ? "HelloWorld.hello('#{name}')" : 'HelloWorld.hello'
  end

  def raises_error?
    expected.to_i == -1
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
