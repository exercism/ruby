module ResistorColorDuo
  COLORS = %w(
    black
    brown
    red
    orange
    yellow
    green
    blue
    violet
    grey
    white
  ).freeze

  def self.value(color_bands)
    color_bands
      .map { |color| COLORS.index(color) }
      .join
      .to_i
  end
end
