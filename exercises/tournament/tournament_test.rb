<<<<<<< HEAD
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'tournament'

class TournamentTest < Minitest::Test

  def input1
    "Allegoric Alaskians;Blithering Badgers;win\n" +
    "Devastating Donkeys;Courageous Californians;draw\n" +
    "Devastating Donkeys;Allegoric Alaskians;win\n" +
    "Courageous Californians;Blithering Badgers;loss\n" +
    "Blithering Badgers;Devastating Donkeys;loss\n" +
    "Allegoric Alaskians;Courageous Californians;win"
  end

  # def input2
  #   "Allegoric Alaskians;Blithering Badgers;win\n" +
  #    "Devastating Donkeys_Courageous Californians;draw\n" +
  #    "Devastating Donkeys;Allegoric Alaskians;win\n" +
  #    "\n" +
  #    "Courageous Californians;Blithering Badgers;loss\n" +
  #    "Bla;Bla;Bla\n" +
  #    "Blithering Badgers;Devastating Donkeys;loss\n" +
  #    "# Yackity yackity yack\n" +
  #    "Allegoric Alaskians;Courageous Californians;win\n" +
  #    "Devastating Donkeys;Courageous Californians;draw"
  #  end
  #
  # def input3
  #   "Allegoric Alaskians;Blithering Badgers;win\n" +
  #   "Devastating Donkeys;Allegoric Alaskians;win\n" +
  #   "Courageous Californians;Blithering Badgers;loss\n" +
  #   "Allegoric Alaskians;Courageous Californians;win"
  # end

  def expected1
    "Team                           | MP |  W |  D |  L |  P\n" +
    "Devastating Donkeys            |  3 |  2 |  1 |  0 |  7\n" +
    "Allegoric Alaskians            |  3 |  2 |  0 |  1 |  6\n" +
    "Blithering Badgers             |  3 |  1 |  0 |  2 |  3\n" +
    "Courageous Californians        |  3 |  0 |  1 |  2 |  1"
  end

  def expected2
    "Team                           | MP |  W |  D |  L |  P\n" +
    "Devastating Donkeys            |  3 |  2 |  1 |  0 |  7\n" +
    "Allegoric Alaskians            |  3 |  2 |  0 |  1 |  6\n" +
    "Blithering Badgers             |  3 |  1 |  0 |  2 |  3\n" +
    "Courageous Californians        |  3 |  0 |  1 |  2 |  1"
  end

  def expected3
    "Team                           | MP |  W |  D |  L |  P\n" +
    "Allegoric Alaskians            |  3 |  2 |  0 |  1 |  6\n" +
    "Blithering Badgers             |  2 |  1 |  0 |  1 |  3\n" +
    "Devastating Donkeys            |  1 |  1 |  0 |  0 |  3\n" +
    "Courageous Californians        |  2 |  0 |  0 |  2 |  0"
  end

  def test_good_input
    tournament = Tournament.new
    assert_equal(tournament.tally(input1), expected1)
  end

  def test_ignore_bad_lines
    skip
    tournament = Tournament.new
    assert_equal(tournament.tally(input2), expected2)
  end
  
  def test_complete_competition
    skip
    tournament = Tournament.new
    assert_equal(tournament.tally(input3), expected3)
  end

  def test_bookkeeping
    skip
    assert_equal 1, Tournament::VERSION
  end
=======
gem 'minitest', '>=5.0.0'
require 'minitest/autorun'
require 'tournament'

class TournamentTest < Minitest::Test

  input_1 =  "Allegoric Alaskians;Blithering Badgers;win\n
  Devastating Donkeys;Courageous Californians;draw\n
  Devastating Donkeys;Allegoric Alaskians;win\n
  Courageous Californians;Blithering Badgers;loss\n
  Blithering Badgers;Devastating Donkeys;loss\n
  Allegoric Alaskians;Courageous Californians;win"

  expected_1 =
" Team                           | MP |  W |  D |  L |  P
  Devastating Donkeys            |  3 |  2 |  1 |  0 |  7
  Allegoric Alaskians            |  3 |  2 |  0 |  1 |  6
  Blithering Badgers             |  3 |  1 |  0 |  2 |  3
  Courageous Californians        |  3 |  0 |  1 |  2 |  1 "
>>>>>>> d8293c3d170c4243343442b665ca5d913161b66d
end
