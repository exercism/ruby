module BookKeeping
  VERSION = 3
end

class BeerSong
  def verses(upper_bound, lower_bound)
    upper_bound.downto(lower_bound).map { |i| verse(i) }.join("\n")
  end

  def verse(number)
    case number
    when 0
      "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
    when 1
      "%s bottle of beer on the wall, %s bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n" % [number, number]
    when 2
      "%s bottles of beer on the wall, %s bottles of beer.\nTake one down and pass it around, %s bottle of beer on the wall.\n" % [number, number, number - 1]
    else
      "%s bottles of beer on the wall, %s bottles of beer.\nTake one down and pass it around, %s bottles of beer on the wall.\n" % [number, number, number - 1]
    end
  end
end
