class ChangeCase < OpenStruct

end

ChangeCases = proc do |data|
  JSON.parse(data)['find_fewest_coins']['cases'].map.with_index do |row, i|
    row = row.merge('index' => i)
    ChangeCase.new(row)
  end
end
