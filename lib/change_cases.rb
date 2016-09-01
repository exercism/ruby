class ChangeCase < OpenStruct
end

ChangeCases = proc do |data|
  JSON.parse(data)['find_fewest_coins']['cases'].map.with_index do |row, idx|
    row = row.merge('index' => idx, 'skipped' => :skip)
    ChangeCase.new(row)
  end
end
