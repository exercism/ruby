module BottleSong

  TRANSLATE = {
    0 => "no", 1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five", 
    6 => "six", 7 => "seven", 8 => "eight", 9 => "nine", 10 => "ten"
  }

  def self.recite(start, amount)
    ((start - amount + 1)..(start)).to_a.reverse.map do |current|
      <<~TEXT
        #{TRANSLATE[current].capitalize} green #{current == 1 ? "bottle" : "bottles"} hanging on the wall,
        #{TRANSLATE[current].capitalize} green #{current == 1 ? "bottle" : "bottles"} hanging on the wall,
        And if one green bottle should accidentally fall,
        There'll be #{TRANSLATE[current - 1]} green #{current - 1 == 1 ? "bottle" : "bottles"} hanging on the wall.
      TEXT
    end.join("\n")
  end
end
