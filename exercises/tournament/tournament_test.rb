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
end
