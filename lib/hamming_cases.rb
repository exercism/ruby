class HammingCase < OpenStruct
  def name
    "test_%s" % description.gsub(/[ -]/, "_")
  end

  def do
    "Hamming.compute('#{strand1}', '#{strand2}')"
  end

  def raises_error?
    expected.to_i == -1
  end

  def skipped?
    index > 0
  end
end

HammingCases = Proc.new do |data|
  JSON.parse(data)["cases"].map.with_index { |row, i|
    HammingCase.new(row.merge("index" => i))
  }
end
