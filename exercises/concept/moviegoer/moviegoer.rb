# This is a custom exception that you can use in your code
class NotMovieClubMemberError < RuntimeError
end

class Moviegoer
  def initialize(age, member: false)
    @age = age
    @member = member
  end

  def ticket_price
    raise 'Please implement the Moviegoer#ticket_price method'
  end

  def watch_scary_movie?
    raise 'Please implement the Moviegoer#watch_scary_movie method'
  end

  # Popcorn is 🍿
  def claim_free_popcorn!
    raise 'Please implement the Moviegoer#claim_free_popcorn method'
  end
end
