class RaindropsCase < OpenStruct
  def name
    'test_%s' % number
  end

  def do
    "Raindrops.convert(#{number})"
  end

  def skipped?
    index > 0
  end
end

RaindropsCases = proc do |data|
  JSON.parse(data)['cases'].map.with_index do |row, i|
    RaindropsCase.new(row.merge('index' => i))
  end
end
