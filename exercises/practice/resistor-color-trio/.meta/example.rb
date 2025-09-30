class ResistorColorTrio
  COLOR_CODES = %i[black brown red orange yellow green blue violet grey white].freeze
  LABELS = %w[ohms kiloohms megaohms gigaohms teraohms].freeze

  def initialize(colors)
    @colors = colors.map(&:to_sym)
    @tens, @ones, @zeros = @colors
  end

  def label
    "Resistor value: #{self}"
  end

  private
  attr_reader :tens, :ones, :zeros

  def significants
    COLOR_CODES.index(tens) * 10 + COLOR_CODES.index(ones)
  end

  def multiplier
    @multiplier ||= 10.pow(COLOR_CODES.index(zeros))
  end

  def value
    significants * multiplier
  end

  def to_s
    index = 0
    value_copy = value
    while value_copy >= 1000 && index < LABELS.size - 1
      value_copy /= 1000
      index += 1
    end
    "#{value_copy} #{LABELS[index]}"
  end
end
