class HighScores
  def initialize(scores)
    @scores = scores
  end

  def scores
    @scores
  end

  def personal_best
    scores.max
  end

  def latest
    scores.last
  end

  def personal_top_three
    scores.max(3)
  end

  def report
    difference = "#{personal_best - latest} short of" if personal_best != latest

    "Your latest score was #{latest}. That's #{difference} your personal best!".squeeze
  end
end
