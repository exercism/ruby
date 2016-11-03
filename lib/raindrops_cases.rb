class RaindropsCase < OpenStruct
  def test_name
    'test_%s' % number
  end

  def workload
    "assert_equal '#{expected}', Raindrops.convert(#{number})"
  end

  def skipped
    index.zero? ? '# skip' : 'skip'
  end
end

RaindropsCases = proc do |data|
  JSON.parse(data)['cases'].map.with_index do |row, i|
    RaindropsCase.new(row.merge('index' => i))
  end
end
