require 'minitest/autorun'
require_relative 'moviegoer'

class MoviegoerTest < Minitest::Test
  def test_regular_ticket_price
    moviegoer = Moviegoer.new(25)
    assert_equal 15, moviegoer.ticket_price
  end

  def test_seniors_discount
    moviegoer = Moviegoer.new(60)
    assert_equal 10, moviegoer.ticket_price
  end

  def test_adults_can_see_the_scary_movie
    moviegoer = Moviegoer.new(25)
    assert_equal "Enjoy the movie!", moviegoer.watch_scary_movie
  end

  def test_kids_cant_see_the_scary_movie
    moviegoer = Moviegoer.new(10)
    assert_equal "You must be over 18 to see this movie.", moviegoer.watch_scary_movie
  end

  def test_movie_club_members_get_free_popcorn
    moviegoer = Moviegoer.new(25, movie_club_member: true)
    assert_equal "Enjoy your free popcorn!", moviegoer.claim_free_popcorn
  end

  def test_regular_moviegoers_dont_get_free_popcorn
    moviegoer = Moviegoer.new(25)
    assert_equal "Join the Movie Club to get free popcorn.", moviegoer.claim_free_popcorn
  end
end
