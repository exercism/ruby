class Scale
  ASCENDING_INTERVALS = %w(m M A)
  CHROMATIC_SCALE = ['C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B']
  FLAT_CHROMATIC_SCALE = %w(C Db D Eb E F Gb G Ab A Bb B)
  FLAT_KEYS = %w(F Bb Eb Ab Db Gb d g c f bb eb)

  def initialize(tonic, pattern = nil)
    @tonic = tonic.capitalize
    @pattern = pattern
    @chromatic_scale = FLAT_KEYS.include?(tonic) ? FLAT_CHROMATIC_SCALE : CHROMATIC_SCALE
  end

  def pitches
    return reorder_chromatic_scale unless pattern
    last_index = 0
    scale = pattern.each_char.with_object([]) do |c, collector|
      collector << reorder_chromatic_scale[last_index]
      last_index += ASCENDING_INTERVALS.index(c) + 1
    end
  end

  private

  attr_reader :tonic, :pattern, :chromatic_scale

  def reorder_chromatic_scale
    return chromatic_scale if tonic == 'C'
    index = chromatic_scale.index(tonic)
    chromatic_scale[index..-1] + chromatic_scale[0..index - 1]
  end
end
