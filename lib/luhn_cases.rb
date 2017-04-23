class LuhnCase < ExerciseCase
  def workload
    "#{assert} Luhn.valid?(#{input.inspect})"
  end
end

LuhnCases = proc do |data|
  JSON.parse(data)['cases'].map.with_index do |row, i|
    LuhnCase.new(row.merge('index' => i))
  end
end
