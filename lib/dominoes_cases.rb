class DominoesCase < OpenStruct


end

DominoesCases = proc do |data|
  JSON.parse(data)['cases'].map.with_index do |row, i|
    row = row.merge('index' => i)
    DominoesCase.new(row)
  end
end