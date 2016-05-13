require 'pry'
class Tournament
  def tally(input1)
    match_hash = Hash.new
    matches = input1.split("\n")
    matches.each do |match|
      match_arr = match.split(";")
      match_hash[match_arr[0]] = {matches.index(match) + 1 => match_arr[2] }
      binding.pry
      case match_arr[2]
      when "win"
        match_hash[match_arr[1]] = {matches.index(match) + 1 => "loss"}
      when "draw"
        match_hash[match_arr[1]] = {matches.index(match) + 1 => "draw"}
      end
    end
  end
  VERSION = 1

end
