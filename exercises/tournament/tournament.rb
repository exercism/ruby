require 'pry'
class Tournament
  def tally(input)
    break_games_into_hash(input)
  end

  def break_games_into_hash(input)
    match_hash = Hash.new
    matches = input.split("\n")
    matches.each_with_index do |match, index|
      match_arr = match.split(";")
      i = 0
      2.times do
        unless match_hash.has_key?(match_arr[i])
          match_hash[match_arr[i]] = {matches: 0, win: 0, loss: 0, draw: 0}
        end
        i += 1
      end
      match_hash[match_arr[0]][:matches] += 1
      match_hash[match_arr[1]][:matches] += 1
      case match_arr[2]
      when "win"
        match_hash[match_arr[0]][:win] += 1
        match_hash[match_arr[1]][:loss] += 1
      when "loss"
        match_hash[match_arr[0]][:loss] += 1
        match_hash[match_arr[1]][:win] += 1
      when "draw"
        match_hash[match_arr[0]][:draw] += 1
        match_hash[match_arr[1]][:draw] += 1
      end
    end
    match_hash
  end



end

VERSION = 1
