class HelloWorldCase < OpenStruct
  def test_name
    'test_%s' % description.gsub(/[ -]/, '_')
  end

  def workload
    assertion =
      if defined?(name)
        "HelloWorld.hello('#{name}')"
      else
        'HelloWorld.hello'
      end
    "assert_equal '#{expected}', #{assertion}"
  end

  def skipped
    index.zero? ? '# skip' : 'skip'
  end
end

HelloWorldCases = proc do |data|
  JSON.parse(data)['cases'].map.with_index do |row, i|
    HelloWorldCase.new(row.merge('index' => i))
  end
end
