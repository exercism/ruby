require 'pry'
class Tournament
  def tally(input1)
    match_hash = Hash.new
    matches = input1.split("\n")
    matches.each_with_index do |match, index|
      match_arr = match.split(";")
      match_hash["Game #{index + 1}"] = {match_arr[0] => match_arr[2], match_arr[1] => "result"}
      case match_arr[2]
      when "win"
        match_hash["Game #{index + 1}"][match_arr[1]] = "loss"
      when "draw"
        match_hash["Game #{index + 1}"][match_arr[1]] = "draw"
      when "loss"
        match_hash["Game #{index + 1}"][match_arr[1]] = "win"
      end
    end
    binding.pry
  end
  VERSION = 1

end
