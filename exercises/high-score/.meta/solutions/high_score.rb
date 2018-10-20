class HighScore
  def initialize(scores)
    @scores = scores
  end

  def scores
    @scores
  end

  def add(new_score)
    scores << new_score
  end

  def highest
    scores.max
  end

  def latest
    scores.last
  end

  def top_3
    scores.sort.reverse.take(3)
  end

  def goal
    verdict = (latest == highest ? "" : " #{highest-latest} short of")

    "Your latest score was #{latest}. That's#{verdict} your personal best!"
  end
end
