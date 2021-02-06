class Moviegoer
  attr_reader :age, :movie_club_member

  def initialize(age, movie_club_member: false)
    @age = age
    @movie_club_member = movie_club_member
  end

  # Do not edit above methods, add your own methods below.
  
  def ticket_price
    raise NotImplementedError, 'Please implement the Moviegoer#ticket_price method'
  end

  def watch_scary_movie
    raise NotImplementedError, 'Please implement the Moviegoer#watch_scary_movie method'
  end

  def claim_free_popcorn
    raise NotImplementedError, 'Please implement the Moviegoer#claim_free_popcorn method'
  end
end
