require 'pry'
class Tournament
  VERSION = 1

end


def create_array(input)
  parsed = input.split("\n")
  result = parsed.collect do |x|
    x.split(";")
  end
  result
end

def score(create_array)
  score_hash = {}
  create_array.each do |match|
    if match[2] == "win"
      score_hash[match[0]] = "win"
      score_hash[match[1]] = "loss"
    elsif match[2] == "loss"
      score_hash[match[0]] = "loss"
      score_hash[match[1]] = "win"
    else
      score_hash[match[0]] = "draw"
      score_hash[match[1]] = "draw"
    end
  end
  score_hash
end

def tally(score)
  tallies = {}
  score.each do |team, result|
    if result == "win"
      binding.pry
      tallies[team][:wins] += 1
    elsif result == "loss"
      tallies[team]["losses"] += 1
    else
      tallies[team]["draws"] += 1
    end
  end
  binding.pry
  tallies
end

input = "Allegoric Alaskians;Blithering Badgers;win
Devastating Donkeys;Courageous Californians;draw
Devastating Donkeys;Allegoric Alaskians;win
Courageous Californians;Blithering Badgers;loss
Blithering Badgers;Devastating Donkeys;loss
Allegoric Alaskians;Courageous Californians;win"

array = create_array(input)
scored = score(array)
tally(scored)
