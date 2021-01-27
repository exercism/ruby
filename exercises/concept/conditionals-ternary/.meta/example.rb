class Moviegoer
  attr_reader :age, :movie_club_member

  def initialize(age, movie_club_member: false)
    @age = age
    @movie_club_member = movie_club_member
  end

  # Do not edit above methods, add your own methods below.
  
  def ticket_price
    age < 60 ? 15 : 10
  end

  def watch_scary_movie
    age >= 18 ? "Enjoy the movie!" : "You must be over 18 to see this movie."
  end

  def claim_free_popcorn
    movie_club_member ? "Enjoy your free popcorn!" : "Join the Movie Club to get free popcorn."
  end
end
