class Scale
  ASCENDING_INTERVALS = %w(m M A)
  CHROMATIC_SCALE = %w(C C# D D# E F F# G G# A A# B)
  FLAT_CHROMATIC_SCALE = %w(C Db D Eb E F Gb G Ab A Bb B)
  FLAT_KEYS = %w(F Bb Eb Ab Db Gb d g c f bb eb)

  def initialize(tonic)
    @tonic = tonic.capitalize
    @chromatic_scale = FLAT_KEYS.include?(tonic) ? FLAT_CHROMATIC_SCALE : CHROMATIC_SCALE
  end

  def chromatic
    reorder_chromatic_scale
  end

  def interval(pattern)
    index = 0
    pattern.each_char.with_object([reorder_chromatic_scale[index]]) do |char, scale|
      index = (index + (ASCENDING_INTERVALS.index(char) + 1)) % 12
      scale << reorder_chromatic_scale[index]
    end
  end

  private

  attr_reader :tonic, :chromatic_scale

  def reorder_chromatic_scale
    return chromatic_scale if tonic == "C"
    index = chromatic_scale.index(tonic)
    chromatic_scale[index..-1] + chromatic_scale[0..index - 1]
  end
end
