class HighScores
  def initialize(scores)
    @scores = scores
  end

  def scores
    @scores
  end

  def highest
    scores.max
  end

  def latest
    scores.last
  end

  def top
    scores.sort.reverse.take(3)
  end

  def report
    difference = "#{highest - latest} short of" if highest != latest

    "Your latest score was #{latest}. That's #{difference} your personal best!".squeeze
  end
end
